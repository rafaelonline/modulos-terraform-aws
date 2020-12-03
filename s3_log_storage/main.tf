data "aws_elb_service_account" "default" {
}

data "aws_iam_policy_document" "default" {

  statement {
    sid = ""

    principals {
      type        = "AWS"
      identifiers = [join("", data.aws_elb_service_account.default.*.arn)]
    }

    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.access_log_bucket_name}/*",
    ]
  }
}