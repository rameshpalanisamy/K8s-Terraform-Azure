variable "location" {
  description = "The location to create the resources"
  type        = string
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}
# linux_profile
variable "enable_linux_profile" {
  type        = bool
  default     = false
  description = "When linux_profile is enabled it's possible to set admin_username and public_ssh_key as well."
}

variable "zones" {
  type        = list(string)
  default     = []
  description = "The availability zones of default aks node pool"
}

variable "admin_username" {
  default     = "azureuser"
  description = "The username of the local administrator to be created on the Kubernetes cluster"
  type        = string
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  type        = string
  default     = ""
}

# NodePool config
variable "agents_size" {
  default     = "Standard_D2s_v3"
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  type        = number
  default     = 2
}

variable "min_count" {
  description = "Min number of system node pool agents"
  type        = number
  default     = 2
}

variable "max_count" {
  description = "Max number of system node pool agents"
  type        = number
  default     = 8
}

variable "enable_auto_scaling" {
  description = "Enable autoscaling for system node pool"
  type        = bool
  default     = false
}

variable "user_pools" {
  type        = map(any)
  default     = {}
  description = "additional node pools to be created"
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}


variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}

variable "private_cluster_enabled" {
  description = "Have Kubernetes Cluster's API server only exposed on internal IP addresses (forces recreation)."
  type        = bool
  default     = false
}

variable "auto_upgrade" {
  description = "Allow autoupgrades for Kubernetes on the Stable channel"
  type        = bool
  default     = false
}

# Monitoring
variable "enable_log_analytics_workspace" {
  type        = bool
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  type        = number
  default     = 30
}

variable "log_analytics_dailyquota" {
  type        = string
  default     = "30"
  description = "Log analytics dailyquota limit in GB"
}
