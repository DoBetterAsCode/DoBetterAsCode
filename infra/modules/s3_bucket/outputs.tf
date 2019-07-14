output "name" {
  value = "${aws_s3_bucket.bucket.bucket}"
}

output "domain" {
  value = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
}

output "website_endpoint" {
  value = "${aws_s3_bucket.bucket.website_endpoint}"
}
