module "bucket" {
  source = "../modules/s3_bucket"
  bucket_name = "${local.project_name}-${var.env}"
}

module "dns_zone" {
  source = "../modules/route53_zone"
  zone_domain = "${var.env}.${local.project_name}.${local.base_domain}"
}