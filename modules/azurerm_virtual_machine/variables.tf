variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "image_publisher" {
  description = "The publisher of the OS image."
  type        = string
}

variable "image_sku" {
  description = "The SKU of the OS image."
  type        = string
}

variable "image_offer" {
  description = "The offer of the OS image."
  type        = string
}

variable "nic_name" {
  description = "The name of the network interface."
  type        = string 
}

variable "subnet_frontend" {
  description = "The name of the frontend subnet."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "azurerm_public_ip_frontend" {
  description = "The name of the public IP address."
  type        = string
}

variable "admin_username" {
  description = "value of the admin username for the virtual machine."
  type        = string 
}
variable "admin_password" {
  description = "value of the admin password for the virtual machine."
  type        = string
}


