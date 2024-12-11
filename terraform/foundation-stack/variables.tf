variable "stack_name" {
  type        = string
  default     = "foundation-stack"
  description = "Name of the stack"
}
variable "stack_create" {
  type        = bool
  default     = true
  description = "should resources be created"
}
variable "stack_tags" {
  type = map(any)
  default = {
    Owner       = "pelotech"
    Environment = "prod"
  }
  description = "tags to be added to the stack, should at least have Owner and Environment"
}
variable "stack_vpc_block" {
  type = object({
    cidr             = string
    azs              = list(string)
    private_subnets  = list(string)
    public_subnets   = list(string)
    database_subnets = list(string)
  })
  default = {
    cidr             = "172.16.0.0/16"
    azs              = ["us-west-2a", "us-west-2b", "us-west-2c"]
    private_subnets  = ["172.16.0.0/24", "172.16.1.0/24", "172.16.2.0/24"]
    public_subnets   = ["172.16.100.0/24", "172.16.101.0/24", "172.16.102.0/24"]
    database_subnets = ["172.16.200.0/24", "172.16.201.0/24", "172.16.202.0/24"]
  }
  description = "Variables for defining the vpc for the stack"
}

variable "extra_access_entries" {
  type = list(object({
    principal_arn           = string
    kubernetes_groups       = optional(list(string))
    policy_arn              = string
    access_scope_type       = string
    access_scope_namespaces = optional(list(string))
  }))
  description = "EKS access entries needed by IAM roles interacting with this cluster"
  default     = []

  validation {
    error_message = "Access scope type can only be 'namespace' or 'cluster'"
    condition = alltrue([
      for v in var.extra_access_entries : contains(["namespace", "cluster"], v.access_scope_type)
    ])
  }

  validation {
    error_message = "The access scope type 'namespace' requires 'access_scope_namespaces', namespaces can't be set otherwise."
    condition = alltrue([
      for v in var.extra_access_entries : ((v.access_scope_type == "namespace" && v.access_scope_namespaces != null) || (v.access_scope_type != "namespace" && v.access_scope_namespaces == null))
    ])
  }
}

variable "stack_ci_admin_arn" {
  type        = string
  description = "arn to the ci role"
}

# TODO: find a cleaner way for KMS access to be able to run plans on the module
variable "stack_ci_ro_arn" {
  type        = string
  description = "arn to the ci role for planning on PRs"
}

variable "stack_admin_arns" {
  type        = list(string)
  default     = []
  description = "arn to the roles for the cluster admins role"
}

variable "stack_ro_arns" {
  type        = list(string)
  default     = []
  description = "arn to the roles for the cluster read only role"
}

variable "initial_node_taints" {
  type = list(object({ key = string, value = string, effect = string }))
  default = [
    {
      key    = "CriticalAddonsOnly"
      value  = "true"
      effect = "NO_SCHEDULE"
    },
    {
      key    = "nidhogg.uswitch.com/kube-system.kube-multus-ds"
      value  = "true"
      effect = "NO_SCHEDULE"
    }
  ]
  description = "taints for the initial managed node group"
}
variable "initial_node_labels" {
  type = map(string)
  default = {
    "kube-ovn/role" = "master"
  }
  description = "labels for the initial managed node group"
}

variable "initial_instance_types" {
  type        = list(string)
  description = "instance types of the initial managed node group"
}

variable "initial_node_min_size" {
  type        = number
  default     = 2
  description = "minimum size of the initial managed node group"
}

variable "initial_node_max_size" {
  type        = number
  default     = 6
  description = "max size of the initial managed node group"
}

variable "initial_node_desired_size" {
  type        = number
  default     = 3
  description = "desired size of the initial managed node group"
}

variable "s3_csi_driver_create_bucket" {
  type        = bool
  default     = true
  description = "create a new bucket for use with the s3 CSI driver"
}

variable "s3_csi_driver_bucket_arns" {
  type        = list(string)
  default     = []
  description = "existing buckets the s3 CSI driver should have access to"
}
variable "vpc_endpoints" {
  type        = list(string)
  description = "vpc endpoints within the cluster vpc network"
  default     = []
}
