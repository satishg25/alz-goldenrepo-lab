output "registry_id" { value = azurerm_container_registry.this.id }
output "registry_name" { value = azurerm_container_registry.this.name }
output "login_server" { value = azurerm_container_registry.this.login_server }
output "sku" { value = azurerm_container_registry.this.sku }
output "private_endpoint_id" {
  value = try(azurerm_private_endpoint.this[0].id, null)
}
output "diagnostic_setting_id" {
  value = try(azurerm_monitor_diagnostic_setting.acr[0].id, null)
}
