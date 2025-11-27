  variable "sql_database_name" {
  description = "SQL Database name"
    type        = string
    }
    variable "sql_server_id" {
  description = "SQL Server ID where the database will be created"
    type        = string
    }
    variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}   