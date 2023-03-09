resource "random_password" "postgres_server_password" {
  length  = 16
  special = false
}

resource "azurerm_resource_group" "main" {
  location = var.location
  name     = var.name
}

resource "azurerm_postgresql_server" "main" {
  name                             = var.name
  location                         = azurerm_resource_group.main.location
  resource_group_name              = azurerm_resource_group.main.name
  sku_name                         = "GP_Gen5_2"
  auto_grow_enabled                = true
  administrator_login              = local.postgres_server_username
  administrator_login_password     = random_password.postgres_server_password.result
  version                          = "11"
  ssl_enforcement_enabled          = true
  geo_redundant_backup_enabled     = true
  public_network_access_enabled    = var.public_network_access_enabled
  ssl_minimal_tls_version_enforced = "TLS1_2"

  threat_detection_policy {
    disabled_alerts      = []
    email_account_admins = false
    email_addresses      = []
    enabled              = true
    retention_days       = 0
  }
}

resource "azurerm_postgresql_firewall_rule" "test" {
  name                = "acctest"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_postgresql_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_postgresql_database" "main" {
  name                = "bitnami_mediawiki"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_postgresql_server.main.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
