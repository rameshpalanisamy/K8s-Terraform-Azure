resource "azurerm_resource_group" "main" {
  name     = var.name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = var.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "main" {
  for_each = toset(compact(module.subnet_addrs.networks.*.name))

  name                 = each.value
  address_prefixes     = [module.subnet_addrs.network_cidr_blocks[each.key]]
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}
