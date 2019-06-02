variable "domain" {
  description = "The FQDN for the certificate"
  type        = "string"
}

variable "zone_id" {
  description = "The Route53 zone ID for certificate validation"
  type        = "string"
}

variable "skip_validation" {
  type = "string"
  default = ""
}
