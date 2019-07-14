output "id" {
  value = "${aws_route53_zone.zone.zone_id}"
}

output "name" {
  value = "${aws_route53_zone.zone.name}"
}
