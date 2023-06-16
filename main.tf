##
# (c) 2021 - Cloud Ops Works LLC - https://cloudops.works/
#            On GitHub: https://github.com/cloudopsworks
#            Distributed Under Apache v2.0 License
#
data "aws_route53_zone" "app_domain" {
  name = var.domain_name
}

resource "aws_route53_record" "app_record_plain" {
  count = var.domain_name_weight < 0 && !var.domain_alias ? 1 : 0

  zone_id = data.aws_route53_zone.app_domain.zone_id
  name    = "${var.domain_name_alias_prefix}.${var.domain_name}"
  type    = "CNAME"
  ttl     = var.default_domain_ttl
  records = [
    var.alias_cname
  ]
}

resource "aws_route53_record" "app_record_weighted" {
  count = var.domain_name_weight >= 0 && !var.domain_alias ? 1 : 0

  zone_id = data.aws_route53_zone.app_domain.zone_id
  name    = "${var.domain_name_alias_prefix}.${var.domain_name}"
  type    = "CNAME"
  ttl     = var.default_domain_ttl

  weighted_routing_policy {
    weight = var.domain_name_weight
  }

  set_identifier = "${var.release_name}-${var.namespace}"
  records = [
    var.alias_cname
  ]
}

resource "aws_route53_record" "app_record_alias" {
  count = var.domain_name_weight < 0 && var.domain_alias ? 1 : 0

  zone_id = data.aws_route53_zone.app_domain.zone_id
  name    = "${var.domain_name_alias_prefix}.${var.domain_name}"
  type    = "A"

  alias {
    evaluate_target_health = var.domain_check_target
    name                   = var.alias_cname
    zone_id                = var.alias_zone_id
  }

  lifecycle {
    precondition {
      condition     = var.alias_zone_id != ""
      error_message = "Zone ID must be set to use Alias records"
    }
  }
}

resource "aws_route53_record" "app_record_alias_weighted" {
  count = var.domain_name_weight >= 0 && var.domain_alias ? 1 : 0

  zone_id = data.aws_route53_zone.app_domain.zone_id
  name    = "${var.domain_name_alias_prefix}.${var.domain_name}"
  type    = "A"

  weighted_routing_policy {
    weight = var.domain_name_weight
  }

  set_identifier = "${var.release_name}-${var.namespace}"
  alias {
    evaluate_target_health = var.domain_check_target
    name                   = var.alias_cname
    zone_id                = var.alias_zone_id
  }

  lifecycle {
    precondition {
      condition     = var.alias_zone_id != ""
      error_message = "Zone ID must be set to use Alias records"
    }
  }
}