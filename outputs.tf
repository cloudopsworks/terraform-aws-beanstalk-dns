##
# (c) 2023 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#

locals {
  record = try(aws_route53_record.app_record_plain, aws_route53_record.app_record_weighted, aws_route53_record.app_record_alias, aws_route53_record.app_record_alias_weighted)
}

output "fqdn" {
  value = local.record.fqdn
}
