##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

locals {
  record = try(aws_route53_record.app_record_plain[0].fqdn, aws_route53_record.app_record_weighted[0].fqdn, aws_route53_record.app_record_alias[0].fqdn, aws_route53_record.app_record_alias_weighted[0].fqdn)
}

output "fqdn" {
  description = "Fully qualified domain name of the Route53 record created by the module, whichever variant (plain, weighted, alias or weighted alias) was selected."
  value       = local.record
}
