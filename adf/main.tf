module "data_factory" {
 source    =  "../resources/datafactory"  
 location             = var.location
 resourcr_group_name   = var.resource_group_name
 adf_name              = var.ADFNAME
}


