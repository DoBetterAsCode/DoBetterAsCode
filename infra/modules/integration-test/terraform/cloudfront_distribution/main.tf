provider "aws" {
  version = "~> 2.13.0"

  region = "ap-southeast-2"
}

provider "aws" {
  alias   = "us-east-1"
  version = "~> 2.13.0"

  region = "us-east-1"
}

locals {
  base_domain = "dobetterascode.com"
}

resource "random_uuid" "uuid" {}

module "bucket" {
  source      = "../../../s3_bucket"
  bucket_name = "${substr(random_uuid.uuid.result, 0, 6)}"
}

data "aws_route53_zone" "domain" {
  name = "${local.base_domain}"
}

module "certificate" {
  providers = {
    aws = "aws.us-east-1"
  }

  source  = "../../../acm_certificate"
  domain  = "${substr(random_uuid.uuid.result, 0, 6)}.${local.base_domain}"
  zone_id = "${data.aws_route53_zone.domain.zone_id}"
}

module "distribution" {
  source          = "../../../cloudfront_distribution"
  domain          = "${substr(random_uuid.uuid.result, 0, 6)}.${local.base_domain}"
  bucket_name     = "${module.bucket.name}"
  bucket_domain   = "${module.bucket.domain}"
  certificate_arn = "${module.certificate.arn}"
}

output "distribution_domain" {
  value = "${module.distribution.cloudfront_domain}"
}
