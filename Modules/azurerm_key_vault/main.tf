resource "azurerm_key_vault" "this" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
  tags                = var.tags
}
output "kv_id" {
  value = azurerm_key_vault.this.id
}