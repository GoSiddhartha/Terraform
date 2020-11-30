resource "azurerm_postgresql_database" "db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = var.server_name
  charset             = var.db_charset
  collation           = var.db_collation
}

resource "azurerm_key_vault_secret" "connection_string_secret" {
  name         = "${var.server_name}-connection-string"
  value        = "Server=${var.server_name};Database=${var.db_name};Port=5432;User Id=${var.server_login};Password=${var.server_password};Ssl Mode=Require;"
  key_vault_id = var.key_vault_id

  depends_on = [
    azurerm_postgresql_database.db
  ]
}