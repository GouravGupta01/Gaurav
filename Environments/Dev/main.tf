#locals {
 # common_tags ={
  #  name = "AksApps"
  #  owner = "Gaurav"
  #}
#}

module "rg" {
    source = "../../modules/azurerm_resource_group"
    rgs = var.rgs   

}

module "acr" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_container_registry"
    acr = var.acr
}

module "sql" {
   depends_on = [ module.rg ]
   source = "../../modules/sql_server"
   sql = var.sql

}


module "aks_cluster" {
    depends_on = [ module.rg ]
    source = "../../modules/k8s_cluster"
    aks = var.aks
  
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_virtual_network" 
    vnet = var.vnet 
}

module "keyvault" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_key_vault"
    keyvault = var.keyvault
  
}

#
# module "storage" {
  #  depends_on = [ module.rg ]
   # source = "../../modules/storage"
    # stg = var.stg
  #
}
