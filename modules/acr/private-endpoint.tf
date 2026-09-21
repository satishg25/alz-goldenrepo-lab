resource "azurerm_private_endpoint" "this" {
  count               = var.private_endpoint_enabled ? 1 : 0
  name                = "pe-${var.acr_name}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.target.name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = local.mandatory_tags

  private_service_connection {
    name                           = "psc-${var.acr_name}"
    private_connection_resource_id = azurerm_container_registry.this.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }
}
