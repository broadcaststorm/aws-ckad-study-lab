module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1" # Use the version suitable for your use case.

  name = "${var.scenario_name}_vpc"
  cidr = var.vpc_cidr

  azs             = keys(local.vpc_private_subnets)
  private_subnets = values(local.vpc_private_subnets)
  public_subnets  = values(local.vpc_public_subnets)

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  manage_default_network_acl = true
  default_network_acl_ingress = var.default_network_acl_ingress

  public_dedicated_network_acl = false
  private_dedicated_network_acl = false

  tags = {
    Terraform = "true"
    Scenario  = "${var.scenario_name}"
  }
}
