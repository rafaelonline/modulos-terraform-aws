resource "aws_acm_certificate" "default" {
  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.subject_alternative_names

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "default" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "default" {
  count           = length(var.subject_alternative_names)
  zone_id         = join("", data.aws_route53_zone.default.*.zone_id)
  ttl             = var.ttl
  allow_overwrite = true
  name            = element(aws_acm_certificate.default.domain_validation_options.*.resource_record_name, count.index)
  type            = element(aws_acm_certificate.default.domain_validation_options.*.resource_record_type, count.index)
  records         = element(aws_acm_certificate.default.domain_validation_options.*.resource_record_value, count.index)
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = join("", aws_acm_certificate.default.*.arn)
  validation_record_fqdns = aws_route53_record.default.*.fqdn
}