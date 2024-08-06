resource "google_vpc_access_connector" "vpc_connector" {
  name         = "my-connector"
  network      = google_compute_network.vpc_network.name
  region       = var.region
  ip_cidr_range = var.ip_cidr_range
}

resource "google_cloud_run_service" "service" {
  name     = "your-app"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/your-app"
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}