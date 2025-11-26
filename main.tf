locals {
  common_tags = {
    ManagedBy   = "Terraform"
    owner       = "Gourav"
    project     = "Todo-App"
    environment = "Dev"
  }
}

module "resource_group" {
  source   = "../../Modules/Azurerm_Resource_Group"
  rg_name  = "dev-todoapp-rg-gourav"
  location = "Central India"
  tags     = local.common_tags
}

# module "storage_account" {
#   depends_on = [module.resource_group]
#
#   source                   = "../../Modules/Azurerm_Storage_Acnt"
#   stg_name                 = "devtodoappstg-gourav"
#   rg_name                  = "dev-todoapp-rg-gourav"
#   location                 = "Central India"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags                     = local.common_tags
# }

module "container_registry" {
  depends_on = [module.resource_group]

  source   = "../../Modules/Azurerm_Container_Registry"
  acr_name = "devtodoappacr-gourav2025"
  rg_name  = "dev-todoapp-rg-gourav"
  location = "Central India"
  tags     = local.common_tags
}

module "kubernetes_cluster" {
  depends_on = [module.resource_group]

  source       = "../../Modules/Azurerm_K8s_Cluster"
  cluster_name = "dev-todoapp-aks-gourav"
  rg_name      = "dev-todoapp-rg-gourav"
  location     = "Central India"
  dns_prefix   = "dev-todoapp-aks-gourav"
  node_count   = 2
  vm_size      = "Standard_D2s_v3"
  tags         = local.common_tags
}

module "sql_server" {
  depends_on = [module.resource_group]

  source             = "../../Modules/Azurerm_SQL_Server"
  sql_server_name    = "devtodoappsqlsrv-gourav"
  rg_name            = "dev-todoapp-rg-gourav"
  location           = "Central India"
  sql_admin_username = "sqladmin-gourav"
  sql_admin_password = "DevopsGourav@1001"
  tags               = local.common_tags
}

module "sql_database" {
  depends_on = [module.sql_server]

  source            = "../../Modules/Azurerm_SQL_Database"
  sql_database_name = "devtodoappdb-gourav"
  sql_server_id     = module.sql_server.azurerm_mssql_server_id

  tags = local.common_tags
}
