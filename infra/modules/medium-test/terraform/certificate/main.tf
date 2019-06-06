provider "aws" {
  version = "~> 2.13.0"

  region = "ap-southeast-2"
}
resource "random_uuid" "uuid" {}

data "aws_route53_zone" "domain" {
  name = "${local.base_domain}"
}

locals {
  base_domain = "dobetterascode.com"
}

module "certificate" {
  source = "../../../acm_certificate"
  domain = "${random_uuid.uuid.result}.${local.base_domain}"
  zone_id = "${data.aws_route53_zone.domain.zone_id}"
}

output "certificate_name" {
  value = "${module.certificate.name}"
}
