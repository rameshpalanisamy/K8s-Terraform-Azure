<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 0.13.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>2.58.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>2.58.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_log_analytics_solution.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.aks_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The username of the local administrator to be created on the Kubernetes cluster | `string` | `"azureuser"` | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | The number of Agents that should exist in the Agent Pool | `number` | `2` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | The default virtual machine size for the Kubernetes agents | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Allow autoupgrades for Kubernetes on the Stable channel | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster Name | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable autoscaling for system node pool | `bool` | `false` | no |
| <a name="input_enable_linux_profile"></a> [enable\_linux\_profile](#input\_enable\_linux\_profile) | When linux\_profile is enabled it's possible to set admin\_username and public\_ssh\_key as well. | `bool` | `false` | no |
| <a name="input_enable_log_analytics_workspace"></a> [enable\_log\_analytics\_workspace](#input\_enable\_log\_analytics\_workspace) | Enable the creation of azurerm\_log\_analytics\_workspace and azurerm\_log\_analytics\_solution or not | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to create the resources | `string` | n/a | yes |
| <a name="input_log_analytics_dailyquota"></a> [log\_analytics\_dailyquota](#input\_log\_analytics\_dailyquota) | Log analytics dailyquota limit in GB | `string` | `"30"` | no |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018 | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The retention period for the logs in days | `number` | `30` | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | Max number of system node pool agents | `number` | `8` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | Min number of system node pool agents | `number` | `2` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Disk size of nodes in GBs. | `number` | `50` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Have Kubernetes Cluster's API server only exposed on internal IP addresses (forces recreation). | `bool` | `false` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | A custom ssh key to control access to the AKS cluster | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Any tags that should be present on the Virtual Network resources | `map(string)` | `{}` | no |
| <a name="input_user_pools"></a> [user\_pools](#input\_user\_pools) | additional node pools to be created | `map(any)` | `{}` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | The availability zones of default aks node pool | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | AKS cluster resource id |
| <a name="output_aks_resource_group"></a> [aks\_resource\_group](#output\_aks\_resource\_group) | AKS resource group |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster |
| <a name="output_host"></a> [host](#output\_host) | The Kubernetes cluster server host |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | Raw Kubernetes config to be used by kubectl and other compatible tools |
| <a name="output_location"></a> [location](#output\_location) | AKS cluster location |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | AKS cluster node resource group |
| <a name="output_system_assigned_identity"></a> [system\_assigned\_identity](#output\_system\_assigned\_identity) | AKS cluster assigned identity |
<!-- END_TF_DOCS -->