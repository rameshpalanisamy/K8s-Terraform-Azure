module "networking" {
  source        = "./modules/networking"
  name          = "${var.name}-vnet"
  location      = "northeurope"
  address_space = "192.168.0.0/22"
  nsg_rule = [
    {
      "destination_port_range"     = "443",
      "priority"                   = "100"
      "name"                       = "allow_https"
      "access"                     = "Allow"
      "source_address_prefix"      = "*"
      "destination_address_prefix" = "*"
    },
    {
      "destination_port_range"     = "80",
      "priority"                   = "1000"
      "name"                       = "Deny_http"
      "access"                     = "Deny"
      "source_address_prefix"      = "*"
      "destination_address_prefix" = "*"
    }
  ]
  subnets = [
    {
      name   = "AKSSubnet"
      suffix = 24
    },
    {
      name   = "PrivateEndpointSubnet"
      suffix = 26
    },
    {
      name   = "JumpboxSubnet"
      suffix = 27
    },
  ]
}


module "aks" {
  source                         = "./modules/aks"
  location                       = "northeurope"
  cluster_name                   = "${var.name}-aks"
  enable_auto_scaling            = true
  min_count                      = 1
  max_count                      = 3
  agents_size                    = "Standard_D4s_v3"
  os_disk_size_gb                = 30
  vnet_subnet_id                 = module.networking.subnets["AKSSubnet"].id
  private_cluster_enabled        = true
  enable_log_analytics_workspace = true
  zones                          = ["1", "2", "3"]
}
module "helm" {
  source                    = "./modules/helm"
  location                  = "northeurope"
  name                      = "${var.name}-postgres"
  privateendpoint_subnet_id = module.networking.subnets["PrivateEndpointSubnet"].id
}
