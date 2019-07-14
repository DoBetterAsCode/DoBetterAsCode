provider "aws" {
  version = "~> 2.13.0"

  region = "ap-southeast-2"
}

resource "random_uuid" "uuid" { }

module "bucket" {
  source = "../../../s3_bucket"
  bucket_name = "${random_uuid.uuid.result}"
}
output "bucket_name" {
  value = "${module.bucket.name}"
}