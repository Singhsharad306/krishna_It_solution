resource "azurerm_key_vault_secret" "admin_username" {
  name         = var.username_secret_name
  key_vault_id = data.key_vault.kv.id
}

resource "azurerm_key_vault_secret" "admin_password" {
  name         = var.password_secret_name
  key_vault_id = data.key_vault.kv.id
}