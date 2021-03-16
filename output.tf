output "vpc_id" {
  description = "Spoke VPC id"
  value = google_compute_network.vpc.id
}

output "subnet_id" {
  description = "Spoke subnet id"
  value = google_compute_subnetwork.subnet.id
}
