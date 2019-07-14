output "id" {
  value = "${aws_cloudfront_distribution.distribution.id}"
}

output "cloudfront_domain" {
  value = "${aws_cloudfront_distribution.distribution.domain_name}"
}

output "cloudfront_hosted_zone_id" {
  value = "${aws_cloudfront_distribution.distribution.hosted_zone_id}"
}
