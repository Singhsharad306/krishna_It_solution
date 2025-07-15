module "azurerm_resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = "todo-app-rg"
  location = "centralindia"
}

module "azurerm_resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = "todo-app-rg1"
  location = "centralindia"
}

module "azurerm_resource_group" {
  source   = "../modules/azurerm_resource_group"
  name     = "todo-app-rg2"
  location = "centralindia"
}

module "azurerm_virtual_network" {
  depends_on          = [module.azurerm_resource_group]
  source              = "../modules/azurerm_virtual_network"
  name                = "todo-app-vnet"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  address_space       = ["10.0.0.0/16"]
}

module "azurerm_subnet_frontend" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../modules/azurerm_subnet"
  name                 = "todo-app-frontend-subnet"
  virtual_network_name = "todo-app-vnet"
  resource_group_name  = "todo-app-rg"
  address_prefixes     = ["10.0.1.0/24"]
}

module "azurerm_subnet_backend" {
  depends_on           = [module.azurerm_virtual_network]
  source               = "../modules/azurerm_subnet"
  name                 = "todo-app-backend-subnet"
  virtual_network_name = "todo-app-vnet"
  resource_group_name  = "todo-app-rg"
  address_prefixes     = ["10.0.2.0/24"]
}

module "azurerm_public_ip_frontend" {
  depends_on          = [module.azurerm_resource_group]
  source              = "../modules/azurerm_public_ip"
  name_pip            = "todo-app-pip-frontend"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  allocation_method   = "Static"
}

module "azurerm_public_ip_backend" {
  depends_on          = [module.azurerm_resource_group]
  source              = "../modules/azurerm_public_ip"
  name_pip            = "todo-app-pip-backend"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
  allocation_method   = "Static"
}

module "azurerm_key_vault" {
  depends_on = [module.azurerm_resource_group]
  source     = "../modules/azurerm_key_vault"

  key_vault_name      = "todo-app-kv"
  location            = "centralindia"
  resource_group_name = "todo-app-rg"
}

module "azurerm_key_vault_secret" {
  depends_on          = [module.azurerm_key_vault]
  source              = "../modules/azurerm_key_vault_secret"

  username_secret_name = "useradmin"
  password_secret_name = "Password@123!"

}

module "frontend_vm" {
  depends_on = [module.azurerm_subnet_frontend, module.azurerm_key_vault, module.azurerm_public_ip_frontend]
  source     = "../modules/azurerm_virtual_machine"

  resource_group_name        = "todo-app-rg"
  location                   = "centralindia"
  vm_name                    = "todo-app-frontend-vm"
  vm_size                       = "Standard_B1s"
  image_publisher            = "canonical"
  image_sku                  = "minimal-20_04-lts"
  image_offer                = "0001-com-ubuntu-minimal-focal"
  nic_name                   = "todo-app-frontend-nic"
  subnet_frontend            = "todo-app-frontend-subnet"
  virtual_network_name       = "todo-app-vnet"
  azurerm_public_ip_frontend = "todo-app-pip-frontend"
  admin_username             = "adminuser"
  admin_password             = "Password@123!"
}