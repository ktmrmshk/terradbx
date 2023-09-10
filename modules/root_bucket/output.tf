output "storage_configuration_id" { value = databricks_mws_storage_configurations.this.storage_configuration_id }
output "bucket_id" { value = aws_s3_bucket.root_storage_bucket.id}
output "bucket_arn" { value = aws_s3_bucket.root_storage_bucket.arn}