resource "azurerm_data_factory" "example" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  
  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_storage_account.example]

  vsts_git_configuration {
    account_name   = "account"
    project_name   = "project"
    repository_url = "https://example.com/repo.git"
    collaboration_branch = "master"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

