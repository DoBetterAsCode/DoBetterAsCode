module "bucket" {
  source = "../modules/s3_bucket"
  bucket_name = "${local.project_name}-${var.env}"
}

module "ssl_certificate" {
  source = "../modules/acm_certificate"
 providers = {
    aws = "aws.us-east-1"
  }
  domain = "${var.env}.${local.base_domain}"
  zone_id = "${data.aws_route53_zone.domain.zone_id}"
}

module "distribution" {
  source = "../modules/cloudfront_distribution"
  domain = "${var.env}.${local.base_domain}"
  bucket_name = "${module.bucket.name}"
  bucket_domain = "${module.bucket.domain}"
  certificate_arn = "${module.ssl_certificate.arn}"
}