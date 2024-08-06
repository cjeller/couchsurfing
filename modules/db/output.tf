output "connection_name" {
  description = "String for Cloud SQL Proxy, e.g. my-project:us-central1:my-db"
  value       = google_sql_database_instance.db_instance.connection_name
}