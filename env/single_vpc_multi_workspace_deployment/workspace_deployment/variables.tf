variable "aws_region" {}
variable "aws_account_id" {}
variable "databricks_account_username" {}
variable "databricks_account_password" {}
variable "databricks_account_id" {}


variable "prefix" {}

variable "vpc_id" {}
variable "private_subnets_for_cluster" {}
variable "selected_azs" {}
variable "route_table_ids" {}

variable "default_security_group_id" {}

variable "credentials_id" {}
variable "uc_metastore_id" {}
variable "aws_role_uc_access_arn" {}

variable "tag_environment" {}
variable "tag_owner" {}
variable "tag_budget" {}