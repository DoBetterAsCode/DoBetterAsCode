resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"
}
