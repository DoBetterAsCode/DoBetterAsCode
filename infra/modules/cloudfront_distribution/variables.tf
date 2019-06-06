variable "bucket_name" {
  description = "The name of the bucket"
  type        = "string"
}

variable "bucket_domain" {
  description = "The regional domain name of the bucket"
  type        = "string"
}

variable "domain" {
  description = "The public domain of the distribution"
  type        = "string"
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = "string"
}