module "example_vpc" {
  source = "../aws_vpc"

  cidr                            = var.cidr
  private_subnets_for_endpoints   = var.private_subnets_for_endpoints
  public_subnets_for_natgw_per_az = var.public_subnets_for_natgw_per_az
  prefix                          = "${local.prefix}-vpc"
  aws_region                      = var.aws_region
}

module "example_cred" {
  source = "../cross_account_iam"

  databricks_account_id = var.databricks_account_id
  prefix                = "${local.prefix}-vpc-cred"
}


module "example_ucms" {
  source = "../uc_metastore"

  aws_region            = var.aws_region
  prefix                = "${local.prefix}-vpc-cred"
  aws_account_id        = var.aws_account_id
  databricks_account_id = var.databricks_account_id
}

