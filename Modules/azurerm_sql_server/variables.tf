variable "sql_server_name" {
  description = "SQL Server name"
    type        = string
    }
    variable "sql_admin_username" {
  description = "SQL Server admin username"
    type        = string
    }
    variable "sql_admin_password" {
  description = "SQL Server admin password"
    type        = string
    sensitive   = true
    }
    variable "rg_name" {}
    variable "location" {}
    variable "tags" {
      
    }