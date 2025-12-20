
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "e5c8e042-8d4d-4e69-8511-a29fb378ec23"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback1"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "e5c8e042-8d4d-4e69-8511-a29fb378ec23"

}
