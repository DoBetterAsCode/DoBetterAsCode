output "name" {
  value = "${aws_acm_certificate.certificate.domain_name}"
}
output "arn" {
  value = "${aws_acm_certificate.certificate.arn}"
}