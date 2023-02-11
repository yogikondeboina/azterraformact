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
        container_name       = "tfstate"
        key                  = "rgterraform.tfstate"
    }

}
provider "azurerm" {
  features {}
}
module "RG" {
source = "./resourcegroup"
lacation = var.location
resouresource_group_name = var.resource_group_name  
}

# module "storage_account" {
#   source  = "./resources/storage"
#   resource_group_name   = "rg-demo-internal-shared-westeurope-002"
#   location              = "westeurope"
#   storage_account_name  = "mystorage"
# }
 