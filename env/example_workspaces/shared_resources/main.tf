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