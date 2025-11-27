variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}
variable "rg_name" {
  description = "Resource Group name"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}
variable "sku" {
  description = "SKU of the Azure Container Registry"
  type        = string
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}
variable "admin_enabled" {
  description = "Enable admin user for the Azure Container Registry"
  type        = bool
}
