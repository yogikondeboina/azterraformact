resource "azurerm_storage_account" "ST" {
  storage_account_name     = var.storage_account_name
  azurerm_resource_group   = var.azurerm_resource_group
  location                 = var.location
  account_tier             = "standerd"
  account_replication_type = "LRS"

}