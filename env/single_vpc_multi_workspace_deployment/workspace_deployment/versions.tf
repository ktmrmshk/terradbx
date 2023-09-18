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
