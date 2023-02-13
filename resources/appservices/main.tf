resource "azurerm_app_service_plan" "appserveice plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appserveice" {
  name                = var.app_service_name
  resource_group_name = var.appservices
  location            = var.location
  }
