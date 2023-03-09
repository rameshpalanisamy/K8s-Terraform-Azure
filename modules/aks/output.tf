output "client_key" {
  value       = azurerm_kubernetes_cluster.main.kube_config[0].client_key
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster"
}

output "client_certificate" {
  value       = azurerm_kubernetes_cluster.main.kube_config[0].client_certificate
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster"
}

output "cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster"
}

output "host" {
  value       = azurerm_kubernetes_cluster.main.kube_config[0].host
  description = "The Kubernetes cluster server host"
}

output "node_resource_group" {
  value       = azurerm_kubernetes_cluster.main.node_resource_group
  description = "AKS cluster node resource group"
}

output "aks_resource_group" {
  value       = azurerm_resource_group.main.name
  description = "AKS resource group"
}

output "location" {
  value       = azurerm_kubernetes_cluster.main.location
  description = "AKS cluster location"
}

output "aks_id" {
  value       = azurerm_kubernetes_cluster.main.id
  description = "AKS cluster resource id"
}

output "kube_config_raw" {
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools"
}

output "system_assigned_identity" {
  value       = azurerm_kubernetes_cluster.main.identity
  description = "AKS cluster assigned identity"
}
