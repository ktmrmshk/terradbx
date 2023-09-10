resource "aws_s3_bucket" "ucms_bucket" {
  bucket        = "${var.prefix}-ucms"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.ucms_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "this" {
  depends_on = [aws_s3_bucket_ownership_controls.this]
  bucket     = aws_s3_bucket.ucms_bucket.id
  acl        = "private"

}

resource "aws_s3_bucket_server_side_encryption_configuration" "ucms_bucket" {
  bucket = aws_s3_bucket.ucms_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "ucms_bucket" {
  bucket                  = aws_s3_bucket.ucms_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  depends_on              = [aws_s3_bucket.ucms_bucket]
}