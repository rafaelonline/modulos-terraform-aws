resource "aws_s3_bucket" "default" {
  bucket        = var.access_log_bucket_name
  acl           = var.acl
  force_destroy = var.force_destroy
  policy        = join("", data.aws_iam_policy_document.default.*.json)

  versioning {
    enabled = var.versioning_enabled
  }

   tags = {
    Ambiente = var.ambiente
    Owner    = var.owner
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  bucket = join("", aws_s3_bucket.default.*.id)

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}