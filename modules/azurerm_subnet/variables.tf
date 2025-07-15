variable "name" {
  description = "The name of the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the virtual network should exist."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to which the subnet belongs."
  type        = string
  
}

variable "address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
}