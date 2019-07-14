resource "aws_route53_record" "delegation" {
  count = "${var.parent_zone_domain != "" ? 1 : 0}"

  type    = "NS"
  zone_id = "${data.aws_route53_zone.parent.id}"
  name    = "${var.zone_domain}"
  ttl     = 3600

  records = [
    "${aws_route53_zone.zone.name_servers.0}",
    "${aws_route53_zone.zone.name_servers.1}",
    "${aws_route53_zone.zone.name_servers.2}",
    "${aws_route53_zone.zone.name_servers.3}",
  ]
}
