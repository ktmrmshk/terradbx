data "aws_availability_zones" "available" {}

locals {
  selected_azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name            = "${var.prefix}-vpc"
  cidr            = var.cidr
  azs             = local.selected_azs
  private_subnets = var.private_subnets_for_endpoints
  public_subnets  = var.public_subnets_for_natgw_per_az

  //properties
  enable_dns_hostnames = true
  create_igw           = true

  //security group
  manage_default_security_group = true
  default_security_group_name   = "${var.prefix}-sg"
  default_security_group_egress = [{
    cidr_blocks = "0.0.0.0/0"
  }]
  default_security_group_ingress = [{
    description = "Allow all internal TCP and UDP"
    self        = true
  }]


  //nat-gw
  enable_nat_gateway     = true
  single_nat_gateway     = false
  one_nat_gateway_per_az = true

}
