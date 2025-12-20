variable "key_vault"{
  type =map(object({
    key_vault_name = string
    location = string
    resource_group_name = string
  }))   
}