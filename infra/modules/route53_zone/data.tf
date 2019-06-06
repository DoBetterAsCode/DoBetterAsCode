data "aws_route53_zone" "parent" {
  count = "${var.parent_zone_domain != "" ? 1 : 0}"
  name = "${var.parent_zone_domain}"
}