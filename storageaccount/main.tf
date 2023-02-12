resource "azurerm_storage_container" "example" {
  name                  = "example"
  storage_account_name  = module.azure_storage_account.name
  container_access_type = "private"
}
