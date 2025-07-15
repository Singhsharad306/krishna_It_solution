variable "name" {
  description = "The name of the virtual network."
  type        = string
}

variable "location" {
  description = "The Azure Region where the virtual network should exist."
  type        = string  
}

variable "resource_group_name" {
  description = "The name of the resource group in which the virtual network should exist."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}