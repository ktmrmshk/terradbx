terraform {
  required_providers {

    databricks = {
      source  = "databricks/databricks"
      version = "1.24.1"
      //configuration_aliases = [ databricks.wms ]

    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}