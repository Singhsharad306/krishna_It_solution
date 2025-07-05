resource "azurerm_key_vault_secret" "kvadmin" {
  name         = "singhadmin"
  value        = var.kvadmin
  key_vault_id = data.azurerm_key_vault.datakey.id
}

resource "azurerm_key_vault_secret" "kvpassword" {
  name         = "singhpassword"
  value        = var.kv
  key_vault_id = data.azurerm_key_vault.datakey.id
}

data "azurerm_key_vault_secret" "kvadmi" {
  name         = "singhadmin"
  key_vault_id = data.azurerm_key_vault.datakey.id
}

data "azurerm_key_vault_secret" "kvpass" {
  
  name         = "singhpassword"
  key_vault_id = data.azurerm_key_vault.datakey.id
}