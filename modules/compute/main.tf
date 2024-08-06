resource "google_compute_instance" "vm_instance_public" {
  name         = var.instance_name
  machine_type = var.instance_size
  zone         = var.zone
  tags          = ["ssh","http"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata_startup_script = data.template_file.linux-metadata.rendered

  network_interface {
    network       = var.subnet
    access_config { }
  }
} 

#simple nginx deployment for startup script for the purpose of demo
data "template_file" "linux-metadata" {
template = <<EOF
apt-get -y update
apt-get -y install nginx
export HOSTNAME=$(hostname | tr -d '\n')
export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /usr/share/nginx/www/index.html
service nginx start
EOF
}