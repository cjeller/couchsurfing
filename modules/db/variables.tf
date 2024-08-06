variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "vpc_link" {
  description = "A link to the VPC where the db will live (i.e. google_compute_network.some_vpc.self_link)"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC where the db will live"
  type        = string
}

variable "db_depends_on" {
  description = "A single resource that the database instance depends on"
  type        = any
}

variable "db_engine" {
  type = string
  default = "POSTGRES_12"
  description = "The database type"
}

variable "db_name" {
  type = string
  description = "The database instance name"
  default = "app-db-instance"
}

variable "db_user" {
  description = "The database username"
  type        = string
  default = "value"
}

variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
}

variable "disk_size" {
  description = "The size in GB of the disk used by the db"
  type        = number
  default     = 100
}

variable "instance_type" {
  description = "The instance type of the VM that will run the db (e.g. db-f1-micro, db-custom-8-32768)"
  type        = string
  default     = "db-f1-micro"
}
