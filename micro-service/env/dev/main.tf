terraform {
	backend "azurerm" {
		# Replace the values below with your backend storage account and container
		storage_account_name = "REPLACE_WITH_STORAGE_ACCOUNT"
		container_name       = "tfstate"
		key                  = "dev.terraform.tfstate"
	}
}

provider "azurerm" {
    features {}
}

module "rgs" {
	source = ".././modules/azurerm_resource_group"
	name = "sharad_rg"
	location = "eastus"
	
}

module "network" {
	source              = ".././modules/azurerm_networking"
	name                = "demo-vnet"
	location            = var.location
	resource_group_name = module.rg.name
	address_space       = ["10.1.0.0/16"]
	subnets = [
		{ name = "app", address_prefix = "10.1.1.0/24" },
	]
}

module "storage" {
	source              = ".././modules/azurerm_storage_account"
	name                = "demomicrodevsa"
	location            = var.location
	resource_group_name = module.rg.name
}

module "keyvault" {
	source              = ".././modules/azurerm_key_vault"
	name                = "demo-micro-kv-dev"
	location            = var.location
	resource_group_name = module.rg.name
	tenant_id           = data.azurerm_client_config.current.tenant_id
}

data "azurerm_client_config" "current" {}

module "app" {
	source              = ".././modules/azurem_compute"
	name                = "demo-micro-app"
	location            = var.location
	resource_group_name = module.rg.name
	container_image     = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
	container_port      = 80
	ip_address_type     = "Public"
}

