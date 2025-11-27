resource "azurerm_user_assigned_identity" "this" {
  name                = var.mi_name
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}
output "mi_id" {
  value = azurerm_user_assigned_identity.this.id
}