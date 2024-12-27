terraform {
  required_version = ">= 1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.45.0"
    }
  }
}
data "aws_partition" "current" {}

locals {
  admin_access_entries = {
    for index, item in concat(var.stack_admin_arns, [var.stack_ci_admin_arn]) : "admin_${index}" => {
      principal_arn = item
      policy_associations = {
        cluster_admin = {
          policy_arn = "arn:${data.aws_partition.current.partition}:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
  ro_access_entries = {
    for index, item in concat(var.stack_ro_arns, [var.stack_ci_ro_arn]) : "ro_${index}" => {
      principal_arn = item
      policy_associations = {
        view_only = {
          policy_arn = "arn:${data.aws_partition.current.partition}:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
  extra_access_entries = {
    for index, item in var.extra_access_entries : "extra_${index}" => {
      principal_arn     = item.principal_arn
      kubernetes_groups = item.kubernetes_groups
      policy_associations = {
        extra_association = {
          policy_arn = item.policy_arn
          access_scope = {
            type       = item.access_scope_type
            namespaces = item.access_scope_namespaces
          }
        }
      }
    }
  }
  s3_csi_arns = compact(concat([module.s3_csi.s3_bucket_arn], var.s3_csi_driver_bucket_arns))
}

module "vpc" {
  source                                 = "terraform-aws-modules/vpc/aws"
  version                                = "5.17.0"
  name                                   = var.stack_name
  enable_dns_hostnames                   = "true"
  enable_dns_support                     = "true"
  enable_nat_gateway                     = "true"
  one_nat_gateway_per_az                 = "true"
  cidr                                   = var.stack_vpc_block.cidr
  azs                                    = var.stack_vpc_block.azs
  private_subnets                        = var.stack_vpc_block.private_subnets
  public_subnets                         = var.stack_vpc_block.public_subnets
  database_subnets                       = var.stack_vpc_block.database_subnets
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "karpenter.sh/discovery"          = var.stack_name
    "kubernetes.io/role/internal-elb" = 1
  }
  tags = merge(var.stack_tags, {
  })
}

data "aws_region" "current" {}

# https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/using-govcloud-vpc-endpoints.html
resource "aws_vpc_endpoint" "eks_vpc_endpoints" {
  for_each     = toset(var.vpc_endpoints)
  vpc_id       = module.vpc.vpc_id
  service_name = "com.amazonaws.${data.aws_region.current.name}.${each.value}"
  tags         = var.stack_tags
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.31.6"
  cluster_name    = var.stack_name
  cluster_version = "1.29"
  create          = var.stack_create
  # TODO: resume usage of node security group; see: https://linear.app/pelotech/issue/PEL-97
  create_node_security_group      = false
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_enabled_log_types       = []

  subnet_ids     = module.vpc.private_subnets
  vpc_id         = module.vpc.vpc_id
  create_kms_key = true
  enable_irsa    = true
  #    cluster_encryption_config = [{
  #      resources = ["secrets"]
  #    }]
  kms_key_administrators = concat(var.stack_admin_arns, [var.stack_ci_admin_arn, var.stack_ci_ro_arn])
  eks_managed_node_groups = {
    "initial-${var.stack_name}" = {
      iam_role_use_name_prefix = false
      instance_types           = var.initial_instance_types
      min_size                 = var.initial_node_min_size
      max_size                 = var.initial_node_max_size
      desired_size             = var.initial_node_desired_size
      capacity_type            = "ON_DEMAND"
      labels                   = var.initial_node_labels
      bootstrap_extra_args     = "--use-max-pods false"
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = 100
            volume_type           = "gp3"
            encrypted             = true
            delete_on_termination = true
          }
        }
      }
      taints = var.initial_node_taints
    }
  }
  access_entries = merge(local.admin_access_entries, local.ro_access_entries, local.extra_access_entries)
  tags = merge(var.stack_tags, {
    # NOTE - if creating multiple security groups with this module, only tag the
    # security group that Karpenter should utilize with the following tag
    # (i.e. - at most, only one security group should have this tag in your account)
    "karpenter.sh/discovery" = var.stack_name
  })
}

module "karpenter" {
  count                           = var.stack_create ? 1 : 0
  source                          = "terraform-aws-modules/eks/aws//modules/karpenter"
  version                         = "20.31.6"
  cluster_name                    = module.eks.cluster_name
  enable_irsa                     = true
  enable_pod_identity             = false # TODO: PR because it doesn't work in govcloud (-> it works now since 8/24)
  enable_v1_permissions           = true
  queue_name                      = var.stack_name
  irsa_oidc_provider_arn          = module.eks.oidc_provider_arn
  irsa_namespace_service_accounts = ["karpenter:karpenter"]
  # TODO: get a better naming conventions for roles
  node_iam_role_name            = "KarpenterNodeRole-${var.stack_name}"
  iam_role_name                 = "${var.stack_name}-karpenter-role"
  iam_role_use_name_prefix      = false
  node_iam_role_use_name_prefix = false
  tags = merge(var.stack_tags, {
  })
}

# IAM roles and policies for the cluster
module "load_balancer_controller_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.51.0"

  create_role = var.stack_create

  role_name                              = "${var.stack_name}-alb-role"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    cluster = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["alb:aws-load-balancer-controller"]
    }
  }
  tags = merge(var.stack_tags, {
  })
}

module "ebs_csi_driver_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.51.0"

  create_role = var.stack_create

  role_name             = "${var.stack_name}-ebs-csi-driver-role"
  attach_ebs_csi_policy = true

  oidc_providers = {
    cluster = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-driver"]
    }
  }
  tags = merge(var.stack_tags, {
  })
}

module "s3_csi" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"
  bucket  = "${var.stack_tags.Owner}-${var.stack_name}-csi-bucket"

  create_bucket                         = var.s3_csi_driver_create_bucket
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true
  block_public_acls                     = true
  block_public_policy                   = true
  ignore_public_acls                    = true
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = merge(var.stack_tags, {
  })
}

module "s3_driver_irsa_role" {
  count       = var.stack_create ? 1 : 0
  source      = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version     = "5.51.0"
  create_role = var.stack_create

  role_name                       = "${var.stack_name}-s3-csi-driver-role"
  attach_mountpoint_s3_csi_policy = true
  mountpoint_s3_csi_bucket_arns   = local.s3_csi_arns
  mountpoint_s3_csi_path_arns     = [for arn in local.s3_csi_arns : "${arn}/*"]
  oidc_providers = {
    cluster = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:s3-csi-driver"]
    }
  }
  tags = merge(var.stack_tags, {
  })
}

module "external_dns_irsa_role" {
  count   = var.stack_create ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.51.0"

  create_role = var.stack_create

  role_name                     = "${var.stack_name}-external-dns-role"
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["*"]

  oidc_providers = {
    cluster = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns-controller"]
    }
  }
  tags = merge(var.stack_tags, {
  })
}

module "cert_manager_irsa_role" {
  count   = var.stack_create ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.51.0"

  create_role = var.stack_create

  role_name                     = "${var.stack_name}-cert-manager-role"
  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = ["*"]

  oidc_providers = {
    cluster = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["cert-manager:cert-manager"]
    }
  }
  tags = merge(var.stack_tags, {
  })
}
