provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

data "azurerm_resource_group" "target" {
  name = var.resource_group_name
}

locals {
  mandatory_tags = merge(var.tags, {
    change_request_id = var.change_request_id
    dso               = var.dso
    managed_by        = "terraform"
    use_case          = "UC-085"
  })
}

resource "azurerm_container_registry" "this" {
  name                          = var.acr_name
  resource_group_name           = data.azurerm_resource_group.target.name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = false
  anonymous_pull_enabled        = false
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = local.mandatory_tags

  lifecycle {
    precondition {
      condition     = !var.private_endpoint_enabled || var.sku == "Premium"
      error_message = "Private endpoint deployment requires Premium SKU."
    }
    precondition {
      condition     = !var.private_endpoint_enabled || (var.private_endpoint_subnet_id != null && var.private_dns_zone_id != null)
      error_message = "Private endpoint deployment requires approved subnet and Private DNS zone IDs."
    }
  }
}
