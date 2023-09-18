provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.tag_environment
      Owner       = var.tag_owner
      Budget      = var.tag_budget
    }
  }
}

provider "databricks" {
  host       = "https://accounts.cloud.databricks.com"
  username   = var.databricks_account_username
  password   = var.databricks_account_password
  account_id = var.databricks_account_id
}


