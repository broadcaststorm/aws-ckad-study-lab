# Define environment name
variable "scenario_name" {
  description = "Name of the infrastructure set being built"
  type = string
  default = "ckad_lab"
}

# Define the network CIDR for this VPC
variable "vpc_cidr" {
  description = "Workload VPC CIDR for VPC"
  type        = string
  default     = "192.168.1.0/24"
}

variable "default_network_acl_ingress" {
  description = "List of maps of ingress rules to set on the Default Network ACL"
  type        = list(map(string))
  default = []
}

# Slice up that CIDR into 
locals {
  vpc_public_subnets = {
    "us-west-2a" = cidrsubnet(var.vpc_cidr, 3, 0)
    "us-west-2b" = cidrsubnet(var.vpc_cidr, 3, 1)
    "us-west-2c" = cidrsubnet(var.vpc_cidr, 3, 2)
    "us-west-2d" = cidrsubnet(var.vpc_cidr, 3, 3)
  }
  vpc_private_subnets = {
    "us-west-2a" = cidrsubnet(var.vpc_cidr, 3, 4)
    "us-west-2b" = cidrsubnet(var.vpc_cidr, 3, 5)
    "us-west-2c" = cidrsubnet(var.vpc_cidr, 3, 6)
    "us-west-2d" = cidrsubnet(var.vpc_cidr, 3, 7)
  }
}
