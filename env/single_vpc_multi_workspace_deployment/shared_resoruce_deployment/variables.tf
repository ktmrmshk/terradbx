variable "prefix" {}

variable "aws_region" {}
variable "aws_account_id" {}

variable "databricks_account_id" {}
variable "databricks_account_username" {}
variable "databricks_account_password" {}


variable "vpc_cidr" {}
variable "private_subnets_for_endpoints" {}
variable "public_subnets_for_natgw_per_az" {}
variable "private_subnets_for_cluster" {}

variable "tag_environment" {}
variable "tag_owner" {}
variable "tag_budget" {}