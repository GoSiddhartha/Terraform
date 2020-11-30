variable "storage_account_depends_on" {
  # the value doesn't matter; we're just using this variable
  # to propagate dependencies.
  type    = any
  default = []
}

resource "azurerm_storage_account" "sa" {
  name                     = "gfsto${var.system_name}${var.environment}azwe"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  is_hns_enabled           = var.is_hns_enabled
  tags                     = var.tags
  account_kind             = var.account_kind
  # This resource depends on whatever the variable
  # depends on, indirectly. This is the same
  # as using var.storage_account_depends_on in
  # an expression above, but for situations where
  # we don't actually need the value.
  depends_on = [var.storage_account_depends_on]
}

resource "azurerm_key_vault_secret" "connection_string_secret" {
  name         = "gfsto${var.system_name}-connection-string"
  value        = azurerm_storage_account.sa.primary_connection_string
  key_vault_id = var.key_vault_id
}