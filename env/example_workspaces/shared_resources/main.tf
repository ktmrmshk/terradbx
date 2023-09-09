variable "prefix" { default = "ktmrdbx" }
variable "aws_region" { default = "ap-northeast-1" }
variable "cidr" { default = "10.99.0.0/16" }
variable "private_subnets_for_endpoints" { default = ["10.99.254.0/24", "10.99.253.0/24"] }
variable "public_subnets_for_natgw_per_az" { default = ["10.99.252.0/24", "10.99.251.0/24"] }
variable "databricks_account_username" {}
variable "databricks_account_password" {}
variable "databricks_account_id" {}


resource "random_string" "randfix" {
  special = false
  upper   = false
  length  = 8
}

locals {

  prefix = "${var.prefix}-${random_string.randfix.result}"
}



module "exapmle_vpc" {
  source = "../../modules/aws_vpc"

  cidr                            = var.cidr
  private_subnets_for_endpoints   = var.private_subnets_for_endpoints
  public_subnets_for_natgw_per_az = var.public_subnets_for_natgw_per_az
  prefix                          = "${local.prefix}-vpc"
  aws_region                      = var.aws_region
}

module "example_cred" {
  source = "../../modules/cross_account_iam"

  aws_region                  = var.aws_region
  databricks_account_username = var.databricks_account_username
  databricks_account_password = var.databricks_account_password
  databricks_account_id       = var.databricks_account_id
  prefix                      = "${local.prefix}-vpc-cred"
}


output "vpc_id" { value = module.exapmle_vpc.vpc_id }
output "default_route_table_id" { value = module.exapmle_vpc.default_route_table_id }
output "default_security_group_id" { value = module.exapmle_vpc.default_security_group_id }
output "route_table_ids" { value = module.exapmle_vpc.route_table_ids }
output "selected_azs" { value = module.exapmle_vpc.selected_azs }

output "credentials_id" { value = module.example_cred.credentials_id }