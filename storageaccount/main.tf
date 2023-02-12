resource "azurerm_storage_container" "example" {
  azurerm_storage_container_name   = "yogiCNTR"
  storage_account_name  = module.azure_storage_account.name
  container_access_type = "private"
}
