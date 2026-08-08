##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#
variable "release_name" {
  type        = string
  description = "(Required) Release name of the deployed application. Combined with namespace to build the weighted record set identifier."
}

variable "namespace" {
  type        = string
  description = "(Required) Namespace that determines the environment naming. Combined with release_name to build the weighted record set identifier."
}
