variable "prefix" {}
variable "aws_region" {}
variable "aws_account_id" {}

variable "cidr" {}
variable "private_subnets_for_endpoints" {}
variable "public_subnets_for_natgw_per_az" {}

variable "databricks_account_id" {}


resource "random_string" "randfix" {
  special = false
  upper   = false
  length  = 8
}

locals {
  prefix = "${var.prefix}-${random_string.randfix.result}"
}