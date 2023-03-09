locals {
  mod_networks = [for i in var.subnets : { name = i.name, new_bits = i.suffix - local.as_suffix }]
  as_suffix    = split("/", var.address_space)[1]
}
