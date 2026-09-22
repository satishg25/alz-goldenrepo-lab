variable "change_request_id" {
  type = string

  validation {
    condition     = can(regex("^RITM[0-9]{7,}$", var.change_request_id))
    error_message = "change_request_id must match RITM followed by at least seven digits."
  }
}

variable "dso" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "acr_name" {
  type = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9]{5,50}$", var.acr_name))
    error_message = "acr_name must contain 5 to 50 alphanumeric characters."
  }
}

variable "location" {
  type = string
}

variable "sku" {
  type = string

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be Basic, Standard, or Premium."
  }
}

variable "public_network_access_enabled" {
  type = bool
}

variable "private_endpoint_enabled" {
  type    = bool
  default = false
}

variable "private_endpoint_subnet_id" {
  type    = string
  default = null
}

variable "private_dns_zone_id" {
  type    = string
  default = null
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
