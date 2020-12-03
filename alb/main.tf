data "aws_acm_certificate" "issued" {
  domain   = var.certificate_url
  statuses = ["ISSUED"]
  most_recent = true
}