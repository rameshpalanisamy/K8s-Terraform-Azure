<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_private_endpoint"></a> [private\_endpoint](#module\_private\_endpoint) | ../privateendpoint | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_postgresql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_database) | resource |
| [azurerm_postgresql_firewall_rule.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_firewall_rule) | resource |
| [azurerm_postgresql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [helm_release.main](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.main](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [random_password.postgres_server_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_private_endpoint"></a> [create\_private\_endpoint](#input\_create\_private\_endpoint) | To check whether to create a private endpoint or not | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Location to create Postgresql server | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Postgresql server and rg | `string` | n/a | yes |
| <a name="input_privateendpoint_subnet_id"></a> [privateendpoint\_subnet\_id](#input\_privateendpoint\_subnet\_id) | Private end point subnet id in aks | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Bool value for postgres network access | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_postgres_server_id"></a> [postgres\_server\_id](#output\_postgres\_server\_id) | n/a |
| <a name="output_postgres_server_name"></a> [postgres\_server\_name](#output\_postgres\_server\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END_TF_DOCS -->