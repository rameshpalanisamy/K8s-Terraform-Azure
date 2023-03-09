variable "resource_group_name" {
  description = "Name of the resource group in which private endpoint to be created"
  type        = string
}

variable "location" {
  type        = string
  description = "Name of the location in which private endpoint needs to be created"
}

variable "privatelink_name" {
  type        = string
  description = "Name of the private link"
}

variable "privateendpoint_subnet_id" {
  type        = string
  description = "Subnet Id to which private endpoint needs to be linked"
}

variable "resource_account_id" {
  type        = string
  description = "Resource Account Id"
}

variable "subresource_names" {
  type        = any
  description = "subresource names"
  default     = ["MongoDB"]
}


variable "dns_zone_name" {
  type        = string
  description = "DNS zone name"
}
