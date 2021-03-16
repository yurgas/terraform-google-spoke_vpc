variable "region" {
    description = "Default region for module resources"
  type    = string
  default = "us-central1"
}

variable "zone" {
    description = "Devault zone for module resources"
  type    = string
  default = "us-central1-a"
}

variable "project_id" {
    description = "Project_id for resources"
    type = string
}

variable "vpc_name" {
    description = "Spoke VPC name"
  type = string
}

variable "subnet_range" {
    description = "Subnet address to be created in VPC"
  type = string
}

variable "hub_vpc_id" {
    description = "HUB VPC id"
    type = string
}
