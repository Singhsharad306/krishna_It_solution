resource "azurerm_subnet" "sub" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_natwork_name
  address_prefixes     = var.address_prefixes

}