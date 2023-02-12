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

module "azure_storage_account" {
  source = "./storageaccount"
  storage_account_name = var.storage_account_name
  location             = var.location
}
 