data "aws_route53_zone" "domain" {
  name = "${local.base_domain}"
}