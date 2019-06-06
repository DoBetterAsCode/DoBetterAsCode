output "name" {
  value = "${aws_s3_bucket.bucket.bucket}"
}

output "domain" {
  value = "${aws_s3_bucket.bucket.bucket_regional_domain_name}"
}