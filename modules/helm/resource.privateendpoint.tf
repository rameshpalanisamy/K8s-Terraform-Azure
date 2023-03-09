module "private_endpoint" {
  source                    = "../privateendpoint"
  count                     = var.create_private_endpoint == true ? 1 : 0
  location                  = var.location
  resource_group_name       = azurerm_resource_group.main.name
  privateendpoint_subnet_id = var.privateendpoint_subnet_id
  resource_account_id       = azurerm_postgresql_server.main.id
  privatelink_name          = replace(var.name, "postgres", "postgres-privateendpoint")
  subresource_names         = ["postgresqlServer"]
  dns_zone_name             = "privatelink.postgres.database.azure.com"
}
