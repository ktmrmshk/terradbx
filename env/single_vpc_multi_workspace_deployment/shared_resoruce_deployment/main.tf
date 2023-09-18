module "shared_resources" {
  source = "../../../modules/shared_resources"

  prefix     = var.prefix
  aws_region = var.aws_region

  cidr                            = var.vpc_cidr
  private_subnets_for_endpoints   = var.private_subnets_for_endpoints
  public_subnets_for_natgw_per_az = var.public_subnets_for_natgw_per_az

  databricks_account_id = var.databricks_account_id
  aws_account_id        = var.aws_account_id

}