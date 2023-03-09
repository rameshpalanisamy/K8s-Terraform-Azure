# Create Azure log analytics workspace
resource "azurerm_log_analytics_workspace" "main" {
  count               = var.enable_log_analytics_workspace ? 1 : 0
  name                = var.cluster_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days
  daily_quota_gb      = var.log_analytics_dailyquota
  tags                = var.tags
}
resource "azurerm_log_analytics_solution" "main" {
  count                 = var.enable_log_analytics_workspace ? 1 : 0
  solution_name         = "ContainerInsights"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  workspace_resource_id = azurerm_log_analytics_workspace.main[0].id
  workspace_name        = azurerm_log_analytics_workspace.main[0].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }

}

# Enable diagnostic settings for the AKS
resource "azurerm_monitor_diagnostic_setting" "aks_logs" {
  count                      = var.enable_log_analytics_workspace ? 1 : 0
  name                       = var.cluster_name
  target_resource_id         = azurerm_kubernetes_cluster.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main[0].id

  log {
    category = "kube-apiserver"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }

  log {
    category = "kube-audit"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }

  log {
    category = "cluster-autoscaler"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }
  log {
    category = "kube-scheduler"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }

  log {
    category = "kube-apiserver"
    enabled  = true
    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true

    retention_policy {
      enabled = true
      days    = var.log_retention_in_days
    }
  }
}
