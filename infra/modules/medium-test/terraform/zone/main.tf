provider "aws" {
  version = "~> 2.6.0"

  region = "ap-southeast-2"
}

locals {
  base_domain = "enchanting.dev"
}

resource "random_uuid" "uuid" { }

module "zone" {
  source = "../../../route53_zone"
  zone_domain = "${random_uuid.uuid.result}.${local.base_domain}"
}

output "zone_name" {
  value = "${module.zone.name}"
}
