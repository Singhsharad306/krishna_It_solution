variable "vnets" {
  description = "Nested map for Virtual Networks"
  type = map(object({
    virtual_network_name= string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    dns_servers         = optional(list(string))
    tags                = optional(map(string))

    subnets = optional(map(object({
      subnet_name             = string
      address_prefixes = list(string)
      nsg_id           = optional(string)
    })))
  }))
}