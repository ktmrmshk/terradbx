resource "aws_iam_policy" "external_data_access" {
  // Terraform's "jsonencode" function converts a
  // Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "${module.root_bucket.bucket_id}-access"
    Statement = [
      {
        "Action" : [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        "Resource" : [
          module.root_bucket.bucket_arn,
          "${module.root_bucket.bucket_arn}/*"
        ],
        "Effect" : "Allow"
      }
    ]
  })
}

data "aws_iam_policy_document" "passrole_for_uc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["arn:aws:iam::414351767826:role/unity-catalog-prod-UCMasterRole-14S5ZJVKOTYTL"]
      type        = "AWS"
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.databricks_account_id]
    }
  }
  statement {
    sid     = "ExplicitSelfRoleAssumption"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.aws_account_id}:root"]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:PrincipalArn"
      values   = [var.aws_role_uc_access_arn]
    }
  }
}

resource "aws_iam_role" "external_data_access" {
  name                = "${var.prefix}-external-access"
  assume_role_policy  = data.aws_iam_policy_document.passrole_for_uc.json
  managed_policy_arns = [aws_iam_policy.external_data_access.arn]
}


resource "time_sleep" "sleep_10_sec_after_uc_assingment" {
  depends_on = [
    databricks_metastore_assignment.this
  ]

  create_duration = "10s"
}

resource "databricks_storage_credential" "external" {
  provider = databricks.workspace

  depends_on = [
    time_sleep.sleep_10_sec_after_uc_assingment
  ]

  name = "${aws_iam_role.external_data_access.name}_debug"
  aws_iam_role {
    role_arn = aws_iam_role.external_data_access.arn
  }
  comment = "Managed by TF"
}

resource "databricks_external_location" "this" {
  provider        = databricks.workspace
  name            = "storage_for_ws_catalog-${var.prefix}"
  url             = "s3://${module.root_bucket.bucket_id}/uccat_ws"
  credential_name = databricks_storage_credential.external.id
  comment         = "Managed by TF"
  force_destroy   = true
  force_update    = true
}


resource "databricks_catalog" "workspace_default" {
  provider = databricks.workspace

  depends_on = [
    time_sleep.sleep_10_sec_after_uc_assingment,
    databricks_external_location.this
  ]

  metastore_id = var.uc_default_metastore_id

  name           = "${var.prefix}_default_catalog"
  isolation_mode = "ISOLATED"
  storage_root   = "s3://${module.root_bucket.bucket_id}/uccat_ws"
  force_destroy  = true

  comment = "this catalog is managed by terraform"
  properties = {
    purpose = "testing"
  }

}
