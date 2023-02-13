resource "azurerm_storage_account" "storageaccount" {
  storage_account_name     = var.storage_account_name
  location                 = var.location
  azurerm_resource_group   = var.azurerm_resource_group
  account_tier             = "standerd"
  account_replication_type = "LRS"
}