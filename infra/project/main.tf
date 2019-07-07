module "bucket" {
  source = "../modules/s3_bucket"
  bucket_name = "${local.project_name}-${var.env}"
}

module "ssl_certificate" {
  source = "../modules/acm_certificate"
 providers = {
    aws = "aws.us-east-1"
  }
  domain = "${local.full_domain}"
  zone_id = "${data.aws_route53_zone.domain.zone_id}"
}

module "distribution" {
  source = "../modules/cloudfront_distribution"
  domain = "${local.full_domain}"
  bucket_name = "${module.bucket.name}"
  bucket_domain = "${module.bucket.website_endpoint}"
  certificate_arn = "${module.ssl_certificate.arn}"
}

module "dns_record" {
  source = "../modules/route53_record"
  zone_domain = "${data.aws_route53_zone.domain.name}"
  subdomain = "${var.env == "prod" ? "" : "${var.env}"}"
  cloudfront_domain_name = "${module.distribution.cloudfront_domain}"
  cloudfront_hosted_zone_id = "${module.distribution.cloudfront_hosted_zone_id}"
}