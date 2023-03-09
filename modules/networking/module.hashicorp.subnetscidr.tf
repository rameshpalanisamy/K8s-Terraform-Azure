/*
 Calc of subnet address prefixes using hashicorp module
 https://registry.terraform.io/modules/hashicorp/subnets/cidr/latest
 */

module "subnet_addrs" {
  source  = "hashicorp/subnets/cidr"
  version = "1.0.0"

  base_cidr_block = var.address_space
  networks        = local.mod_networks
}
