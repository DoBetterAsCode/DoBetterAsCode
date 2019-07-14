module "bucket" {
  source      = "../s3_bucket"
  bucket_name = "${local.project_name}-localstack"
}
