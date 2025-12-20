output "resource_groups_info" {
  description = "All created Resource Groups with name and location"
  value = {
    for rg_key, rg_value in azurerm_resource_group.rgs :
    rg_key => {
      name     = rg_value.name
      location = rg_value.location
    }
  }
}