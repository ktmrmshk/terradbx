provider "databricks" {
  alias      = "mws"
  host       = "https://accounts.cloud.databricks.com"
  username   = var.databricks_account_username
  password   = var.databricks_account_password
  account_id = var.databricks_account_id
}

provider "databricks" {
  alias    = "workspace"
  host     = databricks_mws_workspaces.this.workspace_url
  username = var.databricks_account_username
  password = var.databricks_account_password
}