resource "azurerm_network_security_group" "cluster_subnet_nsg" {
  name                = "${var.name}_nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  dynamic "security_rule" {
    for_each = var.nsg_rule
    content {
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      direction                  = "Inbound"
      access                     = security_rule.value["access"]
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value["destination_port_range"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "cluster_subnet_association" {
  subnet_id                 = azurerm_subnet.main["AKSSubnet"].id
  network_security_group_id = azurerm_network_security_group.cluster_subnet_nsg.id
}
