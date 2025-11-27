variable "rg_name" {
  description = "Name of the Resource Group"
  type        = string
}
variable "location" {
  description = "Azure region"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}
variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
}
variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}
variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}
variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}