<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | DNS zone name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Name of the location in which private endpoint needs to be created | `string` | n/a | yes |
| <a name="input_privateendpoint_subnet_id"></a> [privateendpoint\_subnet\_id](#input\_privateendpoint\_subnet\_id) | Subnet Id to which private endpoint needs to be linked | `string` | n/a | yes |
| <a name="input_privatelink_name"></a> [privatelink\_name](#input\_privatelink\_name) | Name of the private link | `string` | n/a | yes |
| <a name="input_resource_account_id"></a> [resource\_account\_id](#input\_resource\_account\_id) | Resource Account Id | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group in which private endpoint to be created | `string` | n/a | yes |
| <a name="input_subresource_names"></a> [subresource\_names](#input\_subresource\_names) | subresource names | `any` | <pre>[<br>  "MongoDB"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoint"></a> [private\_endpoint](#output\_private\_endpoint) | n/a |
<!-- END_TF_DOCS -->