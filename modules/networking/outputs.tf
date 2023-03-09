output "resource_group" {
  value       = azurerm_resource_group.main
  description = "Network RG"
}

output "virtual_network" {
  value       = azurerm_virtual_network.main
  description = "Created VNET"
}

output "subnets" {
  value       = azurerm_subnet.main
  description = "Created subnets"
}
