resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.username
  administrator_login_password = var.password

}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id

  license_type = var.license_type

  max_size_gb = var.dbsize

  sku_name = var.sku_name

  collation = "SQL_Latin1_General_CP1_CI_AS"

  zone_redundant = false

  geo_backup_enabled = false

  storage_account_type = "Local"

  
}