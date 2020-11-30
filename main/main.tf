## Azure resource provider ##
provider "azurerm" {
  version = "2.6.0"
  features {}
}

## Azure AD provider ##
provider "azuread" {
  version         = "~> 0.7.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant
}

module "az_resource_group" {
  source = "../Modules/rg"

  system_name    = var.project
  location       = var.location
  location_short = var.location_short
  environment    = var.environment
}

module "az_keyvault" {
  source = "../Modules/keyvault"

  system_name         = var.project
  location            = var.location
  location_short      = var.location_short
  environment         = var.environment
  resource_group_name = module.az_resource_group.name
  sku                 = var.kv_sku_name
  access_policies     = var.access_policies
  tags                = var.tags
}

module "az_map_account" {
  source = "../Modules/map-account"

  system_name         = var.project
  location_short      = var.location_short
  environment         = var.environment
  resource_group_name = module.az_resource_group.name
  sku_name            = var.map_sku_name
  key_vault_id        = module.az_keyvault.id
  tags                = var.tags
}

module "az_keyvault_secrets" {
  source = "../Modules/kv-secrets"

  kv_id      = module.az_keyvault.id
  kv_keys    = ["assetfacade-uri", "map-account-uri"]
  kv_secrets = [local.asserfacade_uri, local.map_account_uri]
}






