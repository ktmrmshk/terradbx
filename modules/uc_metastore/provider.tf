terraform {
  required_providers {

    databricks = {
      source  = "databricks/databricks"
      version = "1.24.1"

    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

provider "databricks" {

  alias      = "mws"
  host       = "https://accounts.cloud.databricks.com"
  username   = var.databricks_account_username
  password   = var.databricks_account_password
  account_id = var.databricks_account_id
}

