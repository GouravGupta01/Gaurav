# -------------------------
# Common Variables
# -------------------------
variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
  default     = "Central India"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "todoapp"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "Gourav"
}

# -------------------------
# Resource Group Variables
# -------------------------
variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "dev-todoapp-rg-gourav"
}

# -------------------------
# Storage Account Variables
# -------------------------
variable "stg_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "devtodoappstg-gourav"
}

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}

# -------------------------
# Container Registry Variables
# -------------------------
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
  default     = "devtodoappacr-gourav2025"
}

# -------------------------
# Kubernetes Cluster Variables
# -------------------------
variable "cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "dev-todoapp-aks-gourav"
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
  default     = "dev-todoapp-aks-gourav"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

# -------------------------
# SQL Server Variables
# -------------------------
variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
  default     = "devtodoappsqlsrv-gourav"
}

variable "sql_admin_username" {
  description = "SQL Server admin username"
  type        = string
  default     = "sqladmin-gourav"
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  default     = "DevopsGourav@1001"
  sensitive   = true
}

# -------------------------
# SQL Database Variables
# -------------------------
variable "sql_database_name" {
  description = "Name of the SQL Database"
  type        = string
  default     = "devtodoappdb-gourav"
}
variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
}
variable "admin_username" {
  type        = string
  description = "Admin username for the Virtual Machine"
}
variable "admin_password" {
  type        = string
  description = "Admin password for the Virtual Machine"
}
variable "nic_id" {
  type        = string
  description = "Network Interface ID for the Virtual Machine"
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}

variable "rgs" {
    type = map(object({
        name = string
        location = string
        tags = map(string)
    }))
  
}

variable "sql" {
    type = map(object({
        sql_server_name = string
        rg_name = string
        location = string
        username = string
        password = string
        sqldb_name = string

    }))
  
}


variable "aks" {
    type = map(object({
        name = string
        location = string
        rg_name = string
        dns_prefix = string
        default_node_pool = map(object({
            name = string
            node_count = number
            vm_size = string
        }))
        cluster_tags = map(string)

    }))
  
}

variable "acr" {
    type = map(object({
        name = string
        rg_name = string
        location = string
        sku = string
        tags = map(string)
    }))
  
}


variable "vnet" {
  
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)

    subnet = optional(list(object({
      name              = string
      address_prefixes  = list(string)
    })))
  }))
}


variable "keyvault" {
    type = map(object({
        name = string
        location = string
        rg = string
        enabled_for_disk_encryption = optional(bool,true)
        soft_delete_retention_days = optional(number,7)
        purge_protection_enabled = optional(bool,false)
        sku_name = string
        access_policy = list(object({
            key_permissions = list(string)
            secret_permissions = list(string)
            storage_permissions = list(string)
            
    }))

    }))
  
}

variable "stg" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
  
  }