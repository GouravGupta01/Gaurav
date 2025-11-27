resource "azurerm_mssql_database" "this" {
  name      = var.sql_database_name
  server_id = var.sql_server_id
  sku_name  = "S0"
  tags      = var.tags
}
output "sql_database_id" {
  value = azurerm_mssql_database.this.id
}