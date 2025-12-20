data "azurerm_subnet" "data_subnet" {
    for_each = var.vm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip1" {
  for_each = var.vm
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}