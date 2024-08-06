# FOR DEMO PURPOSES ONLY; for prod leverage CDN, LoadBalancer, and require encypted traffic on 443
resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"] 
}

# allow ssh only from vpn subnet
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [google_compute_subnetwork.vpn_subnet.ip_cidr_range]
  target_tags = ["ssh-enabled"]
}

# Internal traffic
resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    google_compute_subnetwork.private_subnet.ip_cidr_range,
    google_compute_subnetwork.public_subnet.ip_cidr_range,
    google_compute_subnetwork.vpn_subnet.ip_cidr_range
  ]
}