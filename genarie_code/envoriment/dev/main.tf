module "rgs" {
  source          = "../../module/azurerm_reource_group"
  resource_groups = var.resource_groups

}
module "stg" {
  depends_on       = [module.rgs]
  source           = "../../module/azurerm_storage_account"
  storage_accounts = var.storage_accounts

}
module "vnet" {
  depends_on = [module.rgs]
  source     = "../../module/azurerm_vnet"
  vnets      = var.vnets
}
module "nsg" {
  source = "../../module/azurerm_nsg"
  nsgs   = var.nsgs
}
module "pip" {
  source = "../../module/azurerm_pip"
  pip    = var.pip1
}

module "vmm" {
  depends_on = [module.pip, module.vnet
  ]
  source = "../../module/azurerm_vm"
  vm     = var.vmm
}

module "kv" {
  source    = "../../module/azurerm_key_vault"
  key_vault = var.key_vault
}

# module "key_securt"{
#   source = "../../module/azurerm_key_securet"
#   key_secret_admin = var.key_secret_admin1
# }


