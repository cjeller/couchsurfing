output "name" {
  value = google_compute_network.vpc_network.name
}

output "private_ip_cidr" {
  value = google_compute_subnetwork.private_subnet.ip_cidr_range
}

output "public_ip_cidr" {
  value = google_compute_subnetwork.public_subnet.ip_cidr_range
}

output "vpn_ip_cidr" {
  value = google_compute_subnetwork.vpn_subnet.ip_cidr_range
}