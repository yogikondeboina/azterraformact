resource "azurerm_app_service_plan" "appserveice_plan" {
  name                = var.app_service_plan_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  sku                  = var.app_service_plan_sku
}

resource "azurerm_app_service" "appserveice" {
  name                = var.app_service_name
 resource_group_name  = var.resource_group_name
  location             = var.location
  app_service_plan_name = var.app_service_name
}
