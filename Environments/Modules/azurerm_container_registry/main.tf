resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
  tags                = var.tags
}
output "acr_login_server" {
  value = azurerm_container_registry.this.login_server
}