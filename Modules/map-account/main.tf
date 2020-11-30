resource "azurerm_maps_account" "maps" {
  name                = "gf-map-${var.system_name}-${var.environment}-${lower(var.location_short)}"
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name

  tags = var.tags
}

resource "azurerm_key_vault_secret" "id_secret" {
  name         = "map-account-id"
  value        = azurerm_maps_account.maps.id
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "primary_access_key_secret" {
  name         = "map-account-primary-access-key"
  value        = azurerm_maps_account.maps.primary_access_key
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "secondary_access_key_secret" {
  name         = "map-account-secondary-access-key"
  value        = azurerm_maps_account.maps.secondary_access_key
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "client_id_secret" {
  name         = "map-account-clientid"
  value        = azurerm_maps_account.maps.x_ms_client_id
  key_vault_id = var.key_vault_id
}