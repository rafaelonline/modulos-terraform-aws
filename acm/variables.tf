variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued"
}

variable "validation_method" {
  type        = string
  default     = "DNS"
  description = "Method to use for validation, DNS or EMAIL"
}

variable "zone_name" {
  type        = string
  default     = ""
  description = "The name of the desired Route53 Hosted Zone"
}

variable "subject_alternative_names" {
  type        = list(string)
  default     = []
  description = "A list of domains that should be SANs in the issued certificate"
}

variable "ttl" {
  type        = string
  default     = "300"
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
}