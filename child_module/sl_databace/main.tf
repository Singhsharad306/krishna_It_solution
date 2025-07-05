# resource "azurerm_sql_database" "schooldata" {
#   name                = var.database_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   server_name         = var.server_name

  
#   }

  resource "azurerm_mssql_database" "schooldata" {
  name                = var.sldata_name
  server_id           = var.server_id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  sku_name            = "S0"
  max_size_gb         = 10
  zone_redundant      = false
  auto_pause_delay_in_minutes = 60
}