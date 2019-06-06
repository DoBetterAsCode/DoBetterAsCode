variable "zone_domain" {
  description = "The domain name for the Route53 zone"
  type        = "string"
}

variable "parent_zone_domain" {
  description = "The domain of the existing parent Route53 zone"
  type = "string"
  default = ""
}

variable "records" {
  description = "Records for the zone"
  type = "map"
  
  default = {}
}