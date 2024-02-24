variable "owner" {
  description = "owner tags which get added to the resources"
  default     = "pelotech"
  type        = string
}
variable "environment" {
  description = "environment tags which get added to the resources"
  default     = "production"
  type        = string
}
