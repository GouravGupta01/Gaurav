#locals {
 # common_tags ={
  #  name = "AksApps"
  #  owner = "Gaurav"
  #}
#}

module "rg" {
    source = "../../modules/resource_group"
    rgs = var.rgs   

}

module "acr" {
    depends_on = [ module.rg ]
    source = "../../modules/container_registry"
    acr = var.acr
}

module "sql" {
   depends_on = [ module.rg ]
   source = "../../modules/sql"
   sql = var.sql

}


module "aks_cluster" {
    depends_on = [ module.rg ]
    source = "../../modules/kubernetes cluster"
    aks = var.aks
  
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/networking" 
    vnet = var.vnet 
}

module "keyvault" {
    depends_on = [ module.rg ]
    source = "../../modules/azure_keyvault"
    keyvault = var.keyvault
  
}


module "storage" {
    depends_on = [ module.rg ]
    source = "../../modules/storage"
    stg = var.stg
  
}