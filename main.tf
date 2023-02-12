terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "terraform"
        storage_account_name = "tfstorefile"
        container_name       = "statefiles"
        key                  = "rgterraform.tfstate"
    }

}
provider "azurerm" {
  features {}
}
# module "RG" {
# source = "./resourcegroup"
# location = var.location
# resource_group_name = var.resource_group_name  
# }

module "storage_account" {
  source  = "./resources/storageaccount"
  resource_group_name   = var.resource_group_name
  location              = var.location
  storage_account_name  = var.azurerm_storage_account
}
 