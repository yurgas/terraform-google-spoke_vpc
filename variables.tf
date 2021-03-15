variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}

variable "project_id" {
    type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_range" {
  type = string
}

variable "hub_vpc_id" {
    type = string
}
