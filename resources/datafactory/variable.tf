variable "data_factory_name" {
  type    = string
  description = "Name of the Data Factory instance."
}

variable "resource_group_name" {
  type    = string
  description = "Name of the resource group in which to create the Data Factory instance."
}

variable "location" {
  type    = string
  description = "Location for the Data Factory instance."
}

variable "vsts_account_name" {
  type    = string
  description = "Name of the VSTS account."
}

variable "vsts_project_name" {
  type    = string
  description = "Name of the VSTS project."
}

variable "vsts_repository_name" {
  type    = string
  description = "Name of the VSTS repository."
}

# variable "vsts_tenant_id" {
#   type    = string
#   description = "ID of the Azure AD tenant associated with the VSTS account."
# }

# variable "vsts_service_principal_id" {
#   type    = string
#   description = "ID of the Azure AD service principal that has access to the VSTS account."
# }

# variable "vsts_service_principal_secret" {
#   type    = string
#   description = "Password or client secret of the Azure AD service principal."
# }
