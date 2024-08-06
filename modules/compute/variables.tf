variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}

variable "instance_name" {
  description = "GCP Instance Name"
  type        = string
  default     = "app-server"
}

variable "instance_size" {
  description = "GCP Instance Type"
  type        = string
  default     = "e2-medium"
}

variable "image" {
  description = "VM Image"
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "subnet" {
  description = "subnet for VM"
  type = string
}