data "azurerm_subnet" "subnet_frontend" {
  name                 = var.subnet_frontend
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "pip_frontend" {
  name                = var.azurerm_public_ip_frontend
  resource_group_name = var.resource_group_name
}

# data "key_vault" "kv" {
#   name                = var.key_vault_name
#   resource_group_name = var.resource_group_name
# }

# data "admin_username" "secret_user" {
#   name                = var.secrets_admin_name
#   key_vault_id          = data.key_vault.kv.id
# }


# data "admin_password" "secret_password" {
#   name                = var.secrets_password_name
#   key_vault_id          = data.key_vault.kv.id
# }