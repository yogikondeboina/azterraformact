# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~>2.0"
#     }
#   }
#     backend "azurerm" {
#         resource_group_name  = "terraform"
#         storage_account_name = "tfstorefile"
#         container_name       = "statefiles"
#         key                  = "WBterraform.tfstate"
#     }

# }
# provider "azurerm" {
#  # version = ">=2.9.0"
#   features {}
# }
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
#   app_service_plan_name   = var.app_service_plan_name
#   resource_group_name  = var.resource_group_name
#   location             = var.location
#   sku                  = var.app_service_plan_sku
# }

# # App Service app module
# module "app_service_app" {
#   source = "./resources/storageaccount"
#   app_service_name  = var.app_service_name
#   resource_group_name  = var.resource_group_name
#   location             = var.location
#   app_service_plan_name = module.app_service_plan.name
# }
# module "data_factory" {
#  source      = "./resources/adf"
#  location            = var.location
#  resource_group_name = var.resource_group_name 
#  adf_name            = var.ADFNAME
# }

# resource "azurerm_data_factory" "adf" {
#  name     = "yadf"
#  location = "eastus"
#  resource_group_name =  "yogiRG"
# } 
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-vn"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-sn"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
resource "azurerm_private_dns_zone" "example" {
  name                = "example.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
  resource_group_name   = azurerm_resource_group.example.name
}

resource "azurerm_postgresql_flexible_server" "example" {
  name                   = "example-psqlflexibleserver"
  resource_group_name    = azurerm_resource_group.example.name
  location               = azurerm_resource_group.example.location
  version                = "12"
  delegated_subnet_id    = azurerm_subnet.example.id
  private_dns_zone_id    = azurerm_private_dns_zone.example.id
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"

  storage_mb = 32768

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}