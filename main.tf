
provider "google" {
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name                            = var.vpc_name
  project                         = var.project_id
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = true
  mtu                             = 1500
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.vpc_name}-subnet"
  project       = var.project_id
  ip_cidr_range = var.subnet_range
  region        = var.region
  network       = google_compute_network.vpc.id
  
  private_ip_google_access = true
}

# Establish peer

resource "google_compute_network_peering" "spoke_to_hub" {
  name                 = "${var.vpc_name}-to-hub"
  network              = google_compute_network.vpc.id
  peer_network         = var.hub_vpc_id
  import_custom_routes = true
}

resource "google_compute_network_peering" "hub_to_spoke" {
  name                 = "hub-to-${var.vpc_name}"
  network              = var.hub_vpc_id
  peer_network         = google_compute_network.vpc.id
  export_custom_routes = true
}

# Explicit default route to Hub VPC
resource "google_compute_route" "default" {
  name             = "${var.vpc_name}-hub-default"
  project          = var.project_id
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "${var.vpc_name}-to-hub"
  priority         = 10000
}
