#  private endpoint

resource "azurerm_private_endpoint" "private_endpoint" {
  name                = var.privatelink_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.privateendpoint_subnet_id

  private_service_connection {
    name                           = var.privatelink_name
    private_connection_resource_id = var.resource_account_id
    is_manual_connection           = false
    subresource_names              = var.subresource_names
  }
}
