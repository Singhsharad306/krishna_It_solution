resource "azurerm_resource_group" "rg"{
    name = var.resource_group
    location = var.location
}


resource "azurerm_resource_group" "rg1"{
    name = var.resource_group1
    location = var.location2
}