variable "subscription_id" { type = string }
variable "change_request_id" { type = string }
variable "dso" { type = string }
variable "resource_group_name" { type = string }
variable "acr_name" { type = string }
variable "location" { type = string }
variable "sku" { type = string }
variable "diagnostic_workspace_id" { type = string }
variable "public_network_access_enabled" { type = bool }
variable "private_endpoint_subnet_id" {
  type     = string
  default  = null
  nullable = true
}
variable "private_dns_zone_id" {
  type     = string
  default  = null
  nullable = true
}
