resource "random_uuid" "uuid" { }

module "bucket" {
  source = "../s3_bucket"
  bucket_name = "${random_uuid.uuid.result}"
}

module "zone" {
  source = "../route53_zone"
  zone_domain = "${random_uuid.uuid.result}.${local.base_domain}"
}

module "certificate" {
  source = "../acm_certificate"
  domain = "${random_uuid.uuid.result}.${local.base_domain}"
  zone_id = "${module.zone.id}"
  skip_validation = "true"
}

output "bucket_name" {
  value = "${module.bucket.name}"
}

output "zone_name" {
  value = "${module.zone.name}"
}

output "certificate_name" {
  value = "${module.certificate.name}"
}
