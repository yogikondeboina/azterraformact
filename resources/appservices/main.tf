resource "azurerm_app_service_plan" "appserveice_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_app_service" "appserveice" {
  name                = var.app_service_name
  resource_group_name = var.appservices
  location            = var.location
  }
