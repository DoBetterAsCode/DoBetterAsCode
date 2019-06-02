resource "aws_route53_record" "validation_record" {
  name    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_type}"
  zone_id = "${var.zone_id}"
  records = ["${aws_acm_certificate.certificate.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "validation" {
  count = "${var.skip_validation != "" ? 0 : 1}"
  certificate_arn         = "${aws_acm_certificate.certificate.arn}"
  validation_record_fqdns = ["${aws_route53_record.validation_record.fqdn}"]
}