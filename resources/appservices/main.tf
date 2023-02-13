module "app_service_plan" {
  source = "./resources/storageaccount"
  name                 = var.app_service_plan_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  sku                  = var.app_service_plan_sku
}

# App Service app module
module "app_service_app" {
  source = "./resources/storageaccount"
  name                 = var.app_service_name
  resource_group_name  = var.resource_group_name
  location             = var.location
  app_service_plan_name = module.app_service_plan.name
}
