module "shared_resources" {
  source = "../../modules/shared_resources"

  prefix     = var.prefix
  aws_region = var.aws_region

  cidr                            = var.vpc_cidr
  private_subnets_for_endpoints   = var.private_subnets_for_endpoints
  public_subnets_for_natgw_per_az = var.public_subnets_for_natgw_per_az

  databricks_account_id = var.databricks_account_id
  aws_account_id        = var.aws_account_id

}


module "workspace" {
  source = "../../modules/workspace"

  prefix         = var.prefix
  aws_region     = var.aws_region
  aws_account_id = var.aws_account_id

  databricks_account_username = var.databricks_account_username
  databricks_account_password = var.databricks_account_password
  databricks_account_id       = var.databricks_account_id

  vpc_id                  = module.shared_resources.vpc_id
  cidrs                   = var.private_subnets_for_cluster
  azs                     = module.shared_resources.selected_azs
  route_tables            = module.shared_resources.route_table_ids
  security_group          = module.shared_resources.default_security_group_id
  credentials_id          = module.shared_resources.credentials_id
  uc_default_metastore_id = module.shared_resources.uc_metastore_id
  aws_role_uc_access_arn  = module.shared_resources.aws_role_uc_access_arn
}

