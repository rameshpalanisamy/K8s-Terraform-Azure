terraform {
  required_version = "0.13.4"
}

provider "kubernetes" {}

provider "helm" {
  kubernetes {
    config_path = module.aks.kube_config_raw

  }
}

provider "azurerm" {
  features {}
}
