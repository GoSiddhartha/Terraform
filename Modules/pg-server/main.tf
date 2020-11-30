resource "random_password" "psql_pswd" {
  length           = 32
  special          = true
  override_special = "_%@"
}

resource "azurerm_postgresql_server" "primary" {
  name                         = "gfpsql-${var.system_name}-${var.environment}-azwe"
  location                     = var.location
  resource_group_name          = var.resource_group_name

  sku_name                     = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled    

  administrator_login          = var.user_name
  administrator_login_password = random_password.psql_pswd.result
  version                      = var.version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

  tags                         = var.tags
}

resource "azurerm_postgresql_configuration" "configs" {
  count               = length(keys(var.postgresql_configurations))
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.primary.name

  name  = element(keys(var.postgresql_configurations), count.index)
  value = element(values(var.postgresql_configurations), count.index)
}


resource "azurerm_postgresql_firewall_rule" "firewall_rules" {
  count               = length(var.firewall_rules)
  name                = var.firewall_rules[count.index]["name"]
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.primary.name
  start_ip_address    = var.firewall_rules[count.index]["start_ip"]
  end_ip_address      = var.firewall_rules[count.index]["end_ip"]
}
