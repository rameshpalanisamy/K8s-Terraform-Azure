output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "postgres_server_name" {
  value = azurerm_postgresql_server.main.name
}

output "postgres_server_id" {
  value = azurerm_postgresql_server.main.id
}
