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

variable "mi_name" {
  description = "Managed Identity name"
  type        = string
}