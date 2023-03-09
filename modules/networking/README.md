<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>2.58.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet_addrs"></a> [subnet\_addrs](#module\_subnet\_addrs) | hashicorp/subnets/cidr | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.cluster_subnet_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.cluster_subnet_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address Space for Vnet | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for Resource Group | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the vNet and vNet Resource Group | `string` | n/a | yes |
| <a name="input_nsg_rule"></a> [nsg\_rule](#input\_nsg\_rule) | NSG rule for AKSsubnet | `list(map(any))` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of map of subnets, mandatory attributes = name, suffix | `list(map(any))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | Network RG |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | Created subnets |
| <a name="output_virtual_network"></a> [virtual\_network](#output\_virtual\_network) | Created VNET |
<!-- END_TF_DOCS -->