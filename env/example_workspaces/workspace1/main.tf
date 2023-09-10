module "root_bucket" {
  source = "../../../modules/root_bucket/"

  aws_region                  = var.aws_region
  databricks_account_username = var.databricks_account_username
  databricks_account_password = var.databricks_account_password
  databricks_account_id       = var.databricks_account_id
  prefix                      = var.prefix
}

module "cluster_subnets" {
  source = "../../../modules/subnet"

  prefix       = var.prefix
  aws_region   = var.aws_region
  vpc_id       = var.vpc_id
  cidrs        = var.cidrs
  azs          = var.azs
  route_tables = var.route_tables
}

resource "databricks_mws_networks" "this" {
  provider           = databricks.mws
  account_id         = var.databricks_account_id
  network_name       = "${var.prefix}-network"
  security_group_ids = [var.security_group]
  subnet_ids         = module.cluster_subnets.subnet_ids
  vpc_id             = var.vpc_id
}

resource "databricks_mws_workspaces" "this" {
  provider       = databricks.mws
  account_id     = var.databricks_account_id
  aws_region     = var.aws_region
  workspace_name = "${var.prefix}-ws"

  credentials_id           = var.credentials_id
  storage_configuration_id = module.root_bucket.storage_configuration_id
  network_id               = databricks_mws_networks.this.network_id

  token {
    comment = "Terraform"
  }
}

resource "databricks_metastore_assignment" "this" {
  provider     = databricks.mws
  metastore_id = var.uc_default_metastore_id
  workspace_id = databricks_mws_workspaces.this.workspace_id
}

