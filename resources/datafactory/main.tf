resource "azure_ddat_factory" "adf" {
 name                =  var.adf_name
 location = var.location
 resource_group_name = var.resource_group_name  
 tags                =  var.rgTags
 identity {
    type = "systemAssigned"
 } 
}
