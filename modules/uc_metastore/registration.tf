resource "databricks_metastore" "this" {
  provider     = databricks.mws
  name         = "primary"
  storage_root = "s3://${aws_s3_bucket.ucms_bucket.id}/metastore"
  //owner         = var.unity_admin_group
  region        = var.aws_region
  force_destroy = true
}

resource "databricks_metastore_data_access" "this" {
  provider     = databricks.mws
  metastore_id = databricks_metastore.this.id
  name         = aws_iam_role.metastore_data_access.name
  aws_iam_role {
    role_arn = aws_iam_role.metastore_data_access.arn
  }
  is_default = true
}