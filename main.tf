module "vpc" {
  source = "./modules/vpc"
}

module "app_server" {
  source = "./modules/compute"
  subnet = module.vpc.public_ip_cidr
}

module "db" {
  source = "./modules/db"
  vpc_name      = module.vpc.name
  vpc_link      = module.vpc.link

  db_password = random_password.db_password.result

  # There's a dependency relationship between the db and the VPC that
  # terraform can't figure out. The db instance depends on the VPC because it
  # uses a private IP from a block of IPs defined in the VPC. If we just giving
  # the db a public IP, there wouldn't be a dependency. The dependency exists
  # because we've configured private services access. We need to explicitly
  # specify the dependency here. For details, see the note in the docs here:
  #   https://www.terraform.io/docs/providers/google/r/sql_database_instance.html#private-ip-instance
  db_depends_on = module.vpc.private_vpc_connection
}


#  module "dbproxy" {
#    source = "./modules/dbproxy"
#  
#    machine_type     = "f1-micro"
#    db_instance_name = module.db.connection_name # e.g. my-project:us-central1:my-db
#    region           = var.gcp_region
#    zone             = var.gcp_zone
#  
#    # By passing the VPC name as the output of the VPC module we ensure the VPC
#    # will be created before the proxy.
#    vpc_name = module.vpc.name
#  }

module "auth" {
  source = "./modules/auth"
  project_id = var.project_id
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

