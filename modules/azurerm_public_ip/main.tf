resource "azurerm_public_ip" "pip" {
  name                = var.name_pip
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  }