resource "google_compute_network" "vpc_network" {
  name = var.name
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.name}-public"
  ip_cidr_range = var.public_range
  network       = google_compute_network.vpc_network.name
  region        = var.region
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "${var.name}-private"
  ip_cidr_range = var.private_range
  network       = google_compute_network.vpc_network.name
  region        = var.region
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "vpn_subnet" {
  name          = "${var.name}-vpn"
  ip_cidr_range = var.vpn_range
  network       = google_compute_network.vpc_network.name
  region        = var.region
}
