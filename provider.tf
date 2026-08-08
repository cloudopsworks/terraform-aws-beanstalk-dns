##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
# Commented Out: Not Used
# terraform {
#   experiments = [module_variable_optional_attrs]
# }

# provider "aws" {
#   region = var.region
# 
#   assume_role {
#     role_arn     = var.sts_assume_role
#     session_name = "Terraform-ENV-Module"
#     external_id  = "GitHubActionModule"
#   }
# }