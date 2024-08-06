terraform {
  required_providers {
    gcp = {
      source  = "hashicorp/gcp"
      version = ">= 2.7.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}