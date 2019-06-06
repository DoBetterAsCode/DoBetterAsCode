output "name" {
  value = "${aws_acm_certificate.certificate.domain_name}"
}

output "arn" {
  value = "${aws_acm_certificate_validation.validation.0.certificate_arn}"
}