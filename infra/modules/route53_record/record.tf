resource "aws_route53_record" "root_record" {
  type    = "A"
  zone_id = "${data.aws_route53_zone.zone.id}"
  name    = "${local.full_domain}"

  alias {
    name                   = "${var.cloudfront_domain_name}"
    zone_id                = "${var.cloudfront_hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_record" {
  type    = "A"
  zone_id = "${data.aws_route53_zone.zone.id}"
  name    = "www.${local.full_domain}"

  alias {
    name                   = "${var.cloudfront_domain_name}"
    zone_id                = "${var.cloudfront_hosted_zone_id}"
    evaluate_target_health = false
  }
}

locals {
  full_domain = "${var.subdomain != "" ? "${var.subdomain}." : ""}${var.zone_domain}"
}
