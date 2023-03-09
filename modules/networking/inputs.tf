variable "name" {
  description = "Name for the vNet and vNet Resource Group"
  type        = string
}

variable "location" {
  description = "Location for Resource Group"
  type        = string
}

variable "address_space" {
  description = "Address Space for Vnet"
  type        = string
}

variable "subnets" {
  type        = list(map(any))
  description = "List of map of subnets, mandatory attributes = name, suffix"
}

variable "nsg_rule" {
  type        = list(map(any))
  description = "NSG rule for AKSsubnet"
}
