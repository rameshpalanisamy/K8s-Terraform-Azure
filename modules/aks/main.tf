terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.58.0"
    }
  }
  required_version = "0.13.4"

}

resource "azurerm_resource_group" "main" {
  name     = var.cluster_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "main" {
  name                    = var.cluster_name
  location                = azurerm_resource_group.main.location
  resource_group_name     = azurerm_resource_group.main.name
  private_cluster_enabled = var.private_cluster_enabled
  dns_prefix              = "casestudy"

  default_node_pool {
    name                = "nodepool"
    node_count          = var.enable_auto_scaling ? null : var.agents_count
    vm_size             = var.agents_size
    os_disk_size_gb     = var.os_disk_size_gb
    vnet_subnet_id      = var.vnet_subnet_id
    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.enable_auto_scaling ? var.max_count : null
    min_count           = var.enable_auto_scaling ? var.min_count : null
    availability_zones  = var.zones
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  role_based_access_control {
    enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  automatic_channel_upgrade = var.auto_upgrade ? "stable" : null

  addon_profile {
    http_application_routing {
      enabled = false
    }
    azure_policy {
      enabled = true
    }

    dynamic "oms_agent" {
      for_each = var.enable_log_analytics_workspace ? ["log_analytics"] : []
      content {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.main[0].id
      }
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
}
