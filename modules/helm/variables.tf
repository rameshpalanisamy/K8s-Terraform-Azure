variable "name" {
  type        = string
  description = "Name of the Postgresql server and rg"
}

variable "location" {
  type        = string
  description = "Location to create Postgresql server"
}


variable "public_network_access_enabled" {
  type        = bool
  description = "Bool value for postgres network access"
  default     = false
}


variable "privateendpoint_subnet_id" {
  type        = string
  description = "Private end point subnet id in aks"
}

variable "create_private_endpoint" {
  type        = bool
  description = "To check whether to create a private endpoint or not"
  default     = true
}
