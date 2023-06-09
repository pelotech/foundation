<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.alb_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.autoscaler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ebs_csi_driver_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.fluent_bit_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.image_updater_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.alb_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.autoscaler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ebs_csi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.fluent_bit_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_autoscaler_role"></a> [create\_autoscaler\_role](#input\_create\_autoscaler\_role) | n/a | `bool` | `false` | no |
| <a name="input_create_fluent_bit_role"></a> [create\_fluent\_bit\_role](#input\_create\_fluent\_bit\_role) | n/a | `bool` | `false` | no |
| <a name="input_create_roles"></a> [create\_roles](#input\_create\_roles) | n/a | `bool` | `true` | no |
| <a name="input_eks_oidc_issuer_url"></a> [eks\_oidc\_issuer\_url](#input\_eks\_oidc\_issuer\_url) | URL of the cluster's OIDC provider. | `string` | n/a | yes |
| <a name="input_eks_oidc_provider_arn"></a> [eks\_oidc\_provider\_arn](#input\_eks\_oidc\_provider\_arn) | ARN of the cluster's OIDC provider. | `string` | n/a | yes |
| <a name="input_use_us_gov_cloud_arns"></a> [use\_us\_gov\_cloud\_arns](#input\_use\_us\_gov\_cloud\_arns) | Whether to generate policies using arn:aws-us-gov:* prefixed ARNs instead of arn:aws:* | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
