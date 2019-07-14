provider "aws" {
  version = "~> 2.13.0"

  region = "ap-southeast-2"
}

locals {
  base_domain = "dobetterascode.com"
}

resource "random_uuid" "uuid" {}

module "zone" {
  source             = "../../../route53_zone"
  zone_domain        = "${random_uuid.uuid.result}.${local.base_domain}"
  parent_zone_domain = "${local.base_domain}"
}

output "zone_name" {
  value = "${module.zone.name}"
}
