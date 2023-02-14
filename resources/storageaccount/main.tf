# resource "azurerm_storage_account" "storageaccount" {
#   name     = var.storage_account_name
#   location                 = var.location
#   resource_group_name      = var.resource_group_name
#   account_tier             = "standard"
#   account_replication_type = "LRS"
# }