##
# (c) 2023 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  record = try(aws_route53_record.app_record_plain[0].fqdn, aws_route53_record.app_record_weighted[0].fqdn, aws_route53_record.app_record_alias[0].fqdn, aws_route53_record.app_record_alias_weighted[0].fqdn)
}

output "fqdn" {
  value = local.record
}
