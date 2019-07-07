variable "zone_domain" {
  description = "The domain name for the Route53 zone"
  type        = "string"
}

variable "subdomain" {
  description = "The subdomain for the Route53 zone"
  type        = "string"
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFron distribution"
  type = "string"
}

variable "cloudfront_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFron distribution"
  type = "string"
}