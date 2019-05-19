module "bucket" {
  source = "../modules/s3_bucket"
  bucket_name = "${local.project_name}-${var.env}"
}