variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "ip_cidr_range" {
  default = "10.8.0.0/28"
  description = "IP CIDR range for cloudrun"
  type = string
}