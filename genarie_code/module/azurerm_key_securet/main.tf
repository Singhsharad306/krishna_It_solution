# resource "azurerm_key_vault_secret" "key_secret" {
#     for_each = var.key_secret_admin
#   name         = each.value.key_secret_name
#   value        = each.value.key_value
#   key_vault_id = each
  
# }


