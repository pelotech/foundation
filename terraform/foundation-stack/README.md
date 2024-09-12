<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.45.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.45.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cert_manager_irsa_role"></a> [cert\_manager\_irsa\_role](#module\_cert\_manager\_irsa\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.39.1 |
| <a name="module_ebs_csi_driver_irsa_role"></a> [ebs\_csi\_driver\_irsa\_role](#module\_ebs\_csi\_driver\_irsa\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.39.1 |
| <a name="module_eks"></a> [eks](#module\_eks) | terraform-aws-modules/eks/aws | 20.8.5 |
| <a name="module_external_dns_irsa_role"></a> [external\_dns\_irsa\_role](#module\_external\_dns\_irsa\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.39.1 |
| <a name="module_karpenter"></a> [karpenter](#module\_karpenter) | terraform-aws-modules/eks/aws//modules/karpenter | 20.8.5 |
| <a name="module_load_balancer_controller_irsa_role"></a> [load\_balancer\_controller\_irsa\_role](#module\_load\_balancer\_controller\_irsa\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.39.1 |
| <a name="module_s3_csi"></a> [s3\_csi](#module\_s3\_csi) | terraform-aws-modules/s3-bucket/aws | 4.1.2 |
| <a name="module_s3_driver_irsa_role"></a> [s3\_driver\_irsa\_role](#module\_s3\_driver\_irsa\_role) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | 5.39.1 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.8.1 |

## Resources

| Name | Type |
|------|------|
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_initial_node_desired_size"></a> [initial\_node\_desired\_size](#input\_initial\_node\_desired\_size) | desired size of the initial managed node group | `number` | `3` | no |
| <a name="input_initial_node_labels"></a> [initial\_node\_labels](#input\_initial\_node\_labels) | labels for the initial managed node group | `map(string)` | <pre>{<br>  "kube-ovn/role": "master"<br>}</pre> | no |
| <a name="input_initial_node_max_size"></a> [initial\_node\_max\_size](#input\_initial\_node\_max\_size) | max size of the initial managed node group | `number` | `6` | no |
| <a name="input_initial_node_min_size"></a> [initial\_node\_min\_size](#input\_initial\_node\_min\_size) | minimum size of the initial managed node group | `number` | `2` | no |
| <a name="input_initial_node_taints"></a> [initial\_node\_taints](#input\_initial\_node\_taints) | taints for the initial managed node group | `list(object({ key = string, value = string, effect = string }))` | <pre>[<br>  {<br>    "effect": "NO_SCHEDULE",<br>    "key": "CriticalAddonsOnly",<br>    "value": "true"<br>  },<br>  {<br>    "effect": "NO_SCHEDULE",<br>    "key": "nidhogg.uswitch.com/kube-system.kube-multus-ds",<br>    "value": "true"<br>  }<br>]</pre> | no |
| <a name="input_s3_csi_driver_bucket_arns"></a> [s3\_csi\_driver\_bucket\_arns](#input\_s3\_csi\_driver\_bucket\_arns) | existing buckets the s3 CSI driver should have access to | `list(string)` | `[]` | no |
| <a name="input_s3_csi_driver_create_bucket"></a> [s3\_csi\_driver\_create\_bucket](#input\_s3\_csi\_driver\_create\_bucket) | create a new bucket for use with the s3 CSI driver | `bool` | `true` | no |
| <a name="input_stack_admin_arns"></a> [stack\_admin\_arns](#input\_stack\_admin\_arns) | arn to the roles for the cluster admins role | `list(string)` | `[]` | no |
| <a name="input_stack_ci_admin_arn"></a> [stack\_ci\_admin\_arn](#input\_stack\_ci\_admin\_arn) | arn to the ci role | `string` | n/a | yes |
| <a name="input_stack_ci_ro_arn"></a> [stack\_ci\_ro\_arn](#input\_stack\_ci\_ro\_arn) | arn to the ci role for planning on PRs | `string` | n/a | yes |
| <a name="input_stack_create"></a> [stack\_create](#input\_stack\_create) | should resources be created | `bool` | `true` | no |
| <a name="input_stack_name"></a> [stack\_name](#input\_stack\_name) | Name of the stack | `string` | `"foundation-stack"` | no |
| <a name="input_stack_ro_arns"></a> [stack\_ro\_arns](#input\_stack\_ro\_arns) | arn to the roles for the cluster read only role | `list(string)` | `[]` | no |
| <a name="input_stack_tags"></a> [stack\_tags](#input\_stack\_tags) | tags to be added to the stack, should at least have Owner and Environment | `map(any)` | <pre>{<br>  "Environment": "prod",<br>  "Owner": "pelotech"<br>}</pre> | no |
| <a name="input_stack_vpc_block"></a> [stack\_vpc\_block](#input\_stack\_vpc\_block) | Variables for defining the vpc for the stack | <pre>object({<br>    cidr             = string<br>    azs              = list(string)<br>    private_subnets  = list(string)<br>    public_subnets   = list(string)<br>    database_subnets = list(string)<br>  })</pre> | <pre>{<br>  "azs": [<br>    "us-west-2a",<br>    "us-west-2b",<br>    "us-west-2c"<br>  ],<br>  "cidr": "172.16.0.0/16",<br>  "database_subnets": [<br>    "172.16.200.0/24",<br>    "172.16.201.0/24",<br>    "172.16.202.0/24"<br>  ],<br>  "private_subnets": [<br>    "172.16.0.0/24",<br>    "172.16.1.0/24",<br>    "172.16.2.0/24"<br>  ],<br>  "public_subnets": [<br>    "172.16.100.0/24",<br>    "172.16.101.0/24",<br>    "172.16.102.0/24"<br>  ]<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
