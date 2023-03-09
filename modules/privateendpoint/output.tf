output "private_endpoint" {
  value = azurerm_private_endpoint.private_endpoint.custom_dns_configs
}
