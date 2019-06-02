resource "random_uuid" "uuid" { }

module "bucket" {
  source = "../s3_bucket"
  bucket_name = "${random_uuid.uuid.result}"
}

module "zone" {
  source = "../route53_zone"
  zone_domain = "${random_uuid.uuid.result}.${local.base_domain}"
}

output "bucket_name" {
  value = "${module.bucket.name}"
}

output "zone_name" {
  value = "${module.zone.name}"
}
