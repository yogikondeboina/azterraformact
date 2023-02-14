resource "data_factory" {
  source = "./resources/resourcegroup"
  name                    = "example-data-factory"
  location = var.location
  resource_group_name = var.resource_group_name
  tags                    = { environment = "dev" }
  storage_account_name    = var.storage_account_name
}

