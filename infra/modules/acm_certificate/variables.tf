variable "zone_domain" {
  description = "The domain name for the Route53 zone"
  type        = "string"
}

variable "records" {
  description = "Records for the zone"
  type = "map"
  
  default = {}
}