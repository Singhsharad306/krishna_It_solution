provider "azurerm" {
  features = {}
}

module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs = {
    bootstrap = {
      name     = "rg-bootstrap-tfstate"
      location = "eastus"
      tags = { managed_by = "terraform" }
    }
  }
}

module "backend" {
  source = "../../modules/backend"
  storage_account_name = "tfstate$(substr(uuid(),0,8))"
  resource_group_name  = module.rg.rg_ids["bootstrap"]
  location             = "eastus"
  container_name       = "tfstate"
}

output "backend_storage_account" {
  value = module.backend.storage_account_name
}
