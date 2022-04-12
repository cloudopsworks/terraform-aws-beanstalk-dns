## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.app_record_plain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_record_weighted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.app_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_beanstalk_environment_cname"></a> [beanstalk\_environment\_cname](#input\_beanstalk\_environment\_cname) | (required) CNAME to point records to. | `string` | n/a | yes |
| <a name="input_default_domain_ttl"></a> [default\_domain\_ttl](#input\_default\_domain\_ttl) | (optional) Default DNS record TTL setting. 300s | `number` | `300` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (optional) Application environment Route53 managed DNS records. if `domain_name_alias_prefix` is not specified then is not queried. | `string` | `"example.com"` | no |
| <a name="input_domain_name_alias_prefix"></a> [domain\_name\_alias\_prefix](#input\_domain\_name\_alias\_prefix) | (optional) Application name prefix for domain in order to form FQDN. If not specified no DNS record will be created | `string` | `""` | no |
| <a name="input_domain_name_weight"></a> [domain\_name\_weight](#input\_domain\_name\_weight) | (optional) DNS weight >=0 states weighted DNS distribution. | `number` | `-1` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (required) namespace that determines the environment naming | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | # (c) 2021 - Cloud Ops Works LLC - https://cloudops.works/ On GitHub: https://github.com/cloudopsworks Distributed Under Apache v2.0 License | `string` | `"us-east-1"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | # (c) 2021 - Cloud Ops Works LLC - https://cloudops.works/ On GitHub: https://github.com/cloudopsworks Distributed Under Apache v2.0 License | `string` | n/a | yes |
| <a name="input_sts_assume_role"></a> [sts\_assume\_role](#input\_sts\_assume\_role) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
