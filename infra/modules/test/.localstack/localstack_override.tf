provider "aws" {
  version = "~> 1.6.0"
  access_key = "er"
  secret_key = "sd"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  skip_requesting_account_id = true
  endpoints {
    s3     = "http://localstack:4572"
  }
  region = "ap-southeast-2"
}

module "bucket" {
  bucket_name = "${local.project_name}-localstack"
}
