##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
variable "domain_name" {
  type        = string
  default     = "example.com"
  description = "(Optional) Route53 hosted zone name the record is created in. The zone is looked up by name, it must already exist. Default is 'example.com'."
}

variable "domain_name_alias_prefix" {
  type        = string
  default     = ""
  description = "(Optional) Host prefix prepended to domain_name to form the record FQDN, as in '<prefix>.<domain_name>'. Default is empty string."
}

variable "default_domain_ttl" {
  type        = number
  default     = 300
  description = "(Optional) TTL in seconds applied to the CNAME records. Ignored for alias records, which inherit the TTL of the target. Default is 300."
}

variable "domain_name_weight" {
  type        = number
  default     = -1
  description = "(Optional) Weight for weighted routing. Values >= 0 create a weighted record identified by '<release_name>-<namespace>'; a negative value creates a simple record. Default is -1."
}

variable "domain_check_target" {
  type        = bool
  default     = true
  description = "(Optional) Associate a health check with the record. For alias records with no health_check_id set, evaluate_target_health is enabled instead. Default is true."
}

variable "domain_alias" {
  type        = bool
  default     = false
  description = "(Optional) Create a Route53 alias A record instead of a CNAME record. Requires alias_zone_id. Default is false for backwards compatibility."
}

variable "alias_cname" {
  type        = string
  default     = ""
  description = "(Optional) Target the record points to: the CNAME value for CNAME records, or the alias target DNS name for alias records. Default is empty string."
}

variable "alias_zone_id" {
  type        = string
  default     = ""
  description = "(Optional) Route53 hosted zone ID of the alias target. Required when domain_alias is true, the module fails the precondition otherwise. Default is empty string."
}

variable "health_check_id" {
  type        = string
  default     = ""
  description = "(Optional) ID of an existing Route53 health check to associate with the record. Only applied when domain_check_target is true. Default is empty string."
}

variable "private_domain" {
  type        = bool
  default     = false
  description = "(Optional) Look the hosted zone up as a private zone instead of a public one. Default is false."
}
