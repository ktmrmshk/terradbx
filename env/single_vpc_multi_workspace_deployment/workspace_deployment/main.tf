module "workspace" {
  source = "../../../modules/workspace"

  prefix         = var.prefix
  aws_region     = var.aws_region
  aws_account_id = var.aws_account_id

  databricks_account_username = var.databricks_account_username
  databricks_account_password = var.databricks_account_password
  databricks_account_id       = var.databricks_account_id

  vpc_id                  = var.vpc_id
  cidrs                   = var.private_subnets_for_cluster
  azs                     = var.selected_azs
  route_tables            = var.route_table_ids
  security_group          = var.default_security_group_id
  credentials_id          = var.credentials_id
  uc_default_metastore_id = var.uc_metastore_id
  aws_role_uc_access_arn  = var.aws_role_uc_access_arn
}

