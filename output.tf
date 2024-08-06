output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "kubernetes_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "instance_ip" {
  value = google_sql_database_instance.db_instance.connection_name
}


output "url" {
  value = google_cloud_run_service.service.status[0].url
}


output "proxy_ip" {
  description = <<-EOT
    The public IP of the instance running Cloud SQL Proxy. psql into this
    instance to connect to your private db.
    EOT
  value = module.dbproxy.public_ip
}