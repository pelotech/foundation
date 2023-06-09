variable "create_roles" {
  type    = bool
  default = true
}

variable "eks_oidc_provider_arn" {
  type        = string
  description = "ARN of the cluster's OIDC provider."
}

variable "eks_oidc_issuer_url" {
  type        = string
  description = "URL of the cluster's OIDC provider."
}

variable "create_autoscaler_role" {
  type    = bool
  default = false
}

variable "create_fluent_bit_role" {
  type    = bool
  default = false
}

variable "use_us_gov_cloud_arns" {
  type        = bool
  default     = false
  description = "Whether to generate policies using arn:aws-us-gov:* prefixed ARNs instead of arn:aws:*"
}
