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
        key                  = "WBterraform.tfstate"
    }

}
provider "azurerm" {
  features {}
}
# module "RG" {
# source = "./resources/resourcegroup"
# location = var.location
# resource_group_name = var.resource_group_name  
# }

# module "storageaccount" {
#   source = "./resources/storageaccount"
#   storage_account_name      = var.storage_account_name
#   location                  = var.location
#   resource_group_name       = var.resource_group_name
# }
# module "app_service_plan" {
#   source = "./resources/storageaccount"
#   #app_service_plan_name   = var.app_service_plan_name
#   resource_group_name  = var.resource_group_name
#   location             = var.location
#   sku                  = var.app_service_plan_sku
# }

# # App Service app module
# module "app_service_app" {
#   source = "./resources/storageaccount"
#  # app_service_name  = var.app_service_name
#   resource_group_name  = var.resource_group_name
#   location             = var.location
#   app_service_plan_name = module.app_service_plan.name
# }
module "data_factory" {
  source = "./resources/storageaccount"
  
  name                = "example-data-factory"
  location = var.location
resource_group_name = var.resource_group_name  
  tags                = {
    environment = "dev"
  }
}