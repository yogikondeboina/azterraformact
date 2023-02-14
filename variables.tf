variable "storage_account_name" {
 type = string  
}

variable "resource_group_name" {
 type = string  
}
variable "location" {
 type = string  
}

# variable "app_service_plan_name" {
#  type = string  
# }
# variable "app_service_name" {
#  type = string  
# }
# variable "app_service_plan_sku" {
#   type = string
#   default = "B1"
# }
variable "module_create" {
 description = "resource create"  
  type = bool
}

variable "module_adIndex" {
  default = "01"  
}
variable "adfname" {
    type = string 
}
