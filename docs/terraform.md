## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.app_record_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_record_alias_weighted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_record_plain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.app_record_weighted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.app_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alias_cname"></a> [alias\_cname](#input\_alias\_cname) | (Optional) Target the record points to: the CNAME value for CNAME records, or the alias target DNS name for alias records. Default is empty string. | `string` | `""` | no |
| <a name="input_alias_zone_id"></a> [alias\_zone\_id](#input\_alias\_zone\_id) | (Optional) Route53 hosted zone ID of the alias target. Required when domain\_alias is true, the module fails the precondition otherwise. Default is empty string. | `string` | `""` | no |
| <a name="input_default_domain_ttl"></a> [default\_domain\_ttl](#input\_default\_domain\_ttl) | (Optional) TTL in seconds applied to the CNAME records. Ignored for alias records, which inherit the TTL of the target. Default is 300. | `number` | `300` | no |
| <a name="input_domain_alias"></a> [domain\_alias](#input\_domain\_alias) | (Optional) Create a Route53 alias A record instead of a CNAME record. Requires alias\_zone\_id. Default is false for backwards compatibility. | `bool` | `false` | no |
| <a name="input_domain_check_target"></a> [domain\_check\_target](#input\_domain\_check\_target) | (Optional) Associate a health check with the record. For alias records with no health\_check\_id set, evaluate\_target\_health is enabled instead. Default is true. | `bool` | `true` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Optional) Route53 hosted zone name the record is created in. The zone is looked up by name, it must already exist. Default is 'example.com'. | `string` | `"example.com"` | no |
| <a name="input_domain_name_alias_prefix"></a> [domain\_name\_alias\_prefix](#input\_domain\_name\_alias\_prefix) | (Optional) Host prefix prepended to domain\_name to form the record FQDN, as in '<prefix>.<domain\_name>'. Default is empty string. | `string` | `""` | no |
| <a name="input_domain_name_weight"></a> [domain\_name\_weight](#input\_domain\_name\_weight) | (Optional) Weight for weighted routing. Values >= 0 create a weighted record identified by '<release\_name>-<namespace>'; a negative value creates a simple record. Default is -1. | `number` | `-1` | no |
| <a name="input_health_check_id"></a> [health\_check\_id](#input\_health\_check\_id) | (Optional) ID of an existing Route53 health check to associate with the record. Only applied when domain\_check\_target is true. Default is empty string. | `string` | `""` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Required) Namespace that determines the environment naming. Combined with release\_name to build the weighted record set identifier. | `string` | n/a | yes |
| <a name="input_private_domain"></a> [private\_domain](#input\_private\_domain) | (Optional) Look the hosted zone up as a private zone instead of a public one. Default is false. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | (Optional) AWS region the provider operates in. Default is us-east-1. | `string` | `"us-east-1"` | no |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | (Required) Release name of the deployed application. Combined with namespace to build the weighted record set identifier. | `string` | n/a | yes |
| <a name="input_sts_assume_role"></a> [sts\_assume\_role](#input\_sts\_assume\_role) | (Required) ARN of the IAM role assumed by the AWS provider. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | Fully qualified domain name of the Route53 record created by the module, whichever variant (plain, weighted, alias or weighted alias) was selected. |
