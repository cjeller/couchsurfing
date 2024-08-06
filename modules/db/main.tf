resource "google_sql_database" "main" {
  name     = "main"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_database_instance" "db_instance" {
  name             = var.db_name
  database_version = var.db_engine
  region           = var.region
  depends_on       = [var.db_depends_on]

  settings {
    tier      = var.instance_type
    disk_size = var.disk_size
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = var.vpc_link
      enable_private_path_for_google_cloud_services = true
    }
  }
}

resource "google_sql_database" "db" {
  name     = "app-database"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "db_user" {
  name     = "app-user"
  instance = google_sql_database_instance.db_instance.name
  password = var.db_password
}
