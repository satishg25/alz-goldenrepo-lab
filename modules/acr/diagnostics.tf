data "azurerm_monitor_diagnostic_categories" "acr" {
  count       = var.log_analytics_workspace_id == null ? 0 : 1
  resource_id = azurerm_container_registry.this.id
}

resource "azurerm_monitor_diagnostic_setting" "acr" {
  count                      = var.log_analytics_workspace_id == null ? 0 : 1
  name                       = "diag-${var.acr_name}"
  target_resource_id         = azurerm_container_registry.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.acr[0].log_category_types)
    content { category = enabled_log.value }
  }

  dynamic "enabled_metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.acr[0].metrics)
    content { category = enabled_metric.value }
  }
}
