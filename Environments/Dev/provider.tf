
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "I will fill it later"
    resource_group_name  = "dev-rg-back"
    storage_account_name = "devstgback1"
    container_name       = "tfstate"
    key                  = "devinfra.tfstate"
  }

}


provider "azurerm" {
  features {}
  subscription_id = "I will fill it later"

}
