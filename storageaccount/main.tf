resource "azurerm_storage_account" "storage_account" {
name               = var.azurerm_storage_account
resource_group_name   = var.resource_group_name
  location              = var.location
  storage_account_name  = var.azurerm_storage_account
}