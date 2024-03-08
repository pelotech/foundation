terraform {
  required_version = "= 1.5.7"
  #  backend "s3" {
  #    bucket = "something"
  #    key    = "somekey"
  #    region = "us-west-2"
  #  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"
    }
  }
}
locals {
  core_cluster_name = "test"
  create_cluster    = true
  tags              = {}
}
provider "aws" {
  region = "us-west-2"
}
data "aws_caller_identity" "current" {}
resource "aws_ebs_encryption_by_default" "us_west_2" {
  enabled = true
}
module "vpc_core" {
  source                 = "terraform-aws-modules/vpc/aws"
  version                = "5.5.2"
  name                   = "${var.environment}-core"
  enable_dns_hostnames   = "true"
  enable_dns_support     = "true"
  enable_nat_gateway     = "true"
  one_nat_gateway_per_az = "true"
  cidr                   = "172.15.0.0/16"
  azs = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c",
  ]
  private_subnets = [
    "172.15.0.0/24",
    "172.15.1.0/24",
    "172.15.2.0/24",
  ]
  public_subnets = [
    "172.15.100.0/24",
    "172.15.101.0/24",
    "172.15.102.0/24",
  ]
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "karpenter.sh/discovery"          = local.core_cluster_name
  }

  tags = {
    Owner       = var.owner
    Environment = var.environment
  }
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.5.0"
  cluster_name    = local.core_cluster_name
  cluster_version = "1.28"
  create          = local.create_cluster
  # TODO: resume usage of node security group; see: https://linear.app/pelotech/issue/PEL-97
  create_node_security_group      = false
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_enabled_log_types       = []

  subnet_ids     = module.vpc_core.private_subnets
  vpc_id         = module.vpc_core.vpc_id
  create_kms_key = true
  enable_irsa    = true
  kms_key_administrators = [
    "arn:aws:iam::xxxxxx:role/gh-main",
  ]
  eks_managed_node_groups = {
    initial = {
      iam_role_use_name_prefix = false
      instance_types           = ["t3a.medium"]
      min_size                 = 1
      max_size                 = 3
      desired_size             = 2
      capacity_type            = "ON_DEMAND"
      taints = [
        {
          key    = "CriticalAddonsOnly"
          value  = "true"
          effect = "NO_SCHEDULE"
        }
      ]
    }
  }
  #  enable_cluster_creator_admin_permissions = true
  access_entries = {
    administrator_bootstrap = {
      principal_arn = "arnxxxx"
      policy_associations = {
        administrator_bootstrap = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
    administrator = {
      principal_arn = "arnxxxx"
      policy_associations = {
        administrator = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
    read_only = {
      principal_arn = "arnxxxx"
      policy_associations = {
        view_only = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
  tags = merge(local.tags, {
    # NOTE - if creating multiple security groups with this module, only tag the
    # security group that Karpenter should utilize with the following tag
    # (i.e. - at most, only one security group should have this tag in your account)
    "karpenter.sh/discovery" = local.core_cluster_name
  })
}
module "karpenter" {
  count   = local.create_cluster ? 1 : 0
  source  = "terraform-aws-modules/eks/aws//modules/karpenter"
  version = "20.5.0"

  cluster_name                    = module.eks.cluster_name
  enable_irsa                     = true
  queue_name                      = local.core_cluster_name
  irsa_oidc_provider_arn          = module.eks.oidc_provider_arn
  irsa_namespace_service_accounts = ["karpenter:karpenter"]
  node_iam_role_additional_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
  # TODO: get a better naming conventions for roles
  node_iam_role_name            = "KarpenterNodeRole-${local.core_cluster_name}"
  iam_role_name                 = "${local.core_cluster_name}-karpenter-role"
  iam_role_use_name_prefix      = false
  node_iam_role_use_name_prefix = false
}
