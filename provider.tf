terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

#Replace them with Actual ID

provider "azurerm" {
  subscription_id = "var.subscription_id"
  client_id       = "var.client_id"
  client_secret   = "var.client_secret"
  tenant_id       = "var.tenant_id"
  features {}
}

