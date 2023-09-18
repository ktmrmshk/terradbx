resource "databricks_metastore" "this" {
  name         = "primary"
  storage_root = "s3://${aws_s3_bucket.ucms_bucket.id}/metastore"
  //owner         = var.unity_admin_group
  region        = var.aws_region
  force_destroy = true
}


resource "time_sleep" "sleep_10_sec" {
  depends_on = [
    aws_iam_role.metastore_data_access,
    aws_iam_policy.unity_metastore,
    aws_iam_policy.sample_data,
    databricks_metastore.this
  ]

  create_duration = "10s"
}

resource "databricks_metastore_data_access" "this" {
  depends_on = [time_sleep.sleep_10_sec]

  metastore_id = databricks_metastore.this.id
  name         = aws_iam_role.metastore_data_access.name
  aws_iam_role {
    role_arn = aws_iam_role.metastore_data_access.arn
  }
  is_default = true
}