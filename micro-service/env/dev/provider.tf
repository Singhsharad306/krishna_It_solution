terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features = {}
  subscription_id = 
  # Optionally set subscription_id via variable or environment
  # subscription_id = var.subscription_id
}
