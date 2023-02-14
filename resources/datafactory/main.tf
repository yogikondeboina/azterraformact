resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_data_factory" "df" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "dev"
  }

  vsts_git_configuration {
    account_name             = var.vsts_account_name
    project_name             = var.vsts_project_name
    repository_name          = var.vsts_repository_name
    collaboration_branch     = "main"
    root_folder              = ""
    # tenant_id                = var.vsts_tenant_id
    # service_principal_id     = var.vsts_service_principal_id
    # service_principal_secret = var.vsts_service_principal_secret
    use_manual_intervention  = false
    #last_commit_id           = ""
  }
}
