##
# (c) 2022 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#
variable "domain_name" {
  type        = string
  default     = "example.com"
  description = "(optional) Application environment Route53 managed DNS records. if `domain_name_alias_prefix` is not specified then is not queried."
}

variable "domain_name_alias_prefix" {
  type        = string
  default     = ""
  description = "(optional) Application name prefix for domain in order to form FQDN. If not specified no DNS record will be created"
}

variable "default_domain_ttl" {
  type        = number
  default     = 300
  description = "(optional) Default DNS record TTL setting. 300s"
}

variable "domain_name_weight" {
  type        = number
  default     = -1
  description = "(optional) DNS weight >=0 states weighted DNS distribution."
}

variable "domain_check_target" {
  type        = bool
  default     = true
  description = "(optional) Check if domain is available. This directs the to be an alias record to be health cheched automatically."
}

variable "domain_alias" {
  type        = bool
  default     = false
  description = "(optional) Create domain alias record. If false, then a simple CNAME record will be created, check target is not available if false. Default is false for backwards compat."
}

variable "alias_cname" {
  type        = string
  default     = ""
  description = "(optional) CNAME to point records to."
}

variable "alias_zone_id" {
  type        = string
  default     = ""
  description = "(optional) Route53 zone to create records in."
}

variable "health_check_id" {
  type        = string
  default     = ""
  description = "(optional) Route53 health check to associate with the record."
}

variable "private_domain" {
  type        = bool
  default     = false
  description = "(optional) Route53 Public domain indicator for zone search. Default to false."
}