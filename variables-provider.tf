##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "(Optional) AWS region the provider operates in. Default is us-east-1."
}

variable "sts_assume_role" {
  type        = string
  description = "(Required) ARN of the IAM role assumed by the AWS provider."
}