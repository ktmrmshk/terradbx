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

  default_tags {
    tags = {
      Environment = var.tag_environment
      Owner       = var.tag_owner
      Budget      = var.tag_budget
    }
  }
}