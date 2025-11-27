variable "stg_name" {
  description = "Storage Account name"
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

variable "account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}

variable "kv_name" {
  description = "Key Vault name"
  type        = string  
}
variable "tenant_id" {
  description = "Tenant ID for Key Vault access"
  type        = string
}