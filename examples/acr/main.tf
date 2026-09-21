module "acr" {
  source = "../../modules/azure-container-registry"

  acr_name                       = var.acr_name
  resource_group_name            = var.resource_group_name
  location                       = var.location
  sku                            = var.sku
  public_network_access_enabled  = var.public_network_access_enabled
  private_endpoint_subnet_id     = var.private_endpoint_subnet_id
  private_dns_zone_id            = var.private_dns_zone_id
  diagnostic_workspace_id        = var.diagnostic_workspace_id

  tags = {
    change_request_id = var.change_request_id
    dso               = var.dso
    managed_by        = "terraform"
  }
}
