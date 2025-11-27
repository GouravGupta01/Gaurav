resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
  version                      = "12.0"
  tags                         = var.tags
}
output "sql_server_id" {
  value = azurerm_mssql_server.this.id
}