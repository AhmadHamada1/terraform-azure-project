resource "azurerm_mssql_server" "sql_server" {
  name                         = "example-sqlserver-${random_id.name.hex}"
  resource_group_name          = var.resource_group_name
  location                     = "eastasia"
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "random_id" "name" {
  byte_length = 8
}

resource "azurerm_mssql_database" "sql_database" {
  name     = "example-database"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "S0"
}
