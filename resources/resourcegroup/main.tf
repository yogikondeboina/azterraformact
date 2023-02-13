resource "azurerm_resource_group" "state-demo-secure" {
  name     = var.resource_group_name
  location = var.location
}