variable "name" {
  type = string
  description = "VPC Name"
  default = "vpc-network"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "public_range" {
  description = "IP Range of public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "private_range" {
  description = "IP Range of private subnet"
  type = string
  default = "10.0.2.0/24"
}

variable "vpn_range" {
  description = "IP Range of vpn subnet"
  type = string
  default = "10.0.3.0/24"
}