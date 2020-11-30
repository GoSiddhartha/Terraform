resource "azurerm_eventgrid_topic" "eg_topic" {
  name                = "gf-egt-${lower(var.system_name)}-${lower(var.environment)}-azwe"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_eventgrid_event_subscription" "eg_sub" {
  name  = "gf-egs-${lower(var.system_name)}-${lower(var.environment)}-azwe"
  scope = azurerm_eventgrid_topic.eg_topic.id

  webhook_endpoint {
    url = var.webhook_url
  }

  depends_on = [
    azurerm_eventgrid_topic.eg_topic
  ]
}


resource "azurerm_key_vault_secret" "endpoint_secret" {
  name         = "${azurerm_eventgrid_topic.eg_topic.name}-endpoint"
  value        = azurerm_eventgrid_topic.eg_topic.endpoint
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "access_key_secret" {
  name         = "${azurerm_eventgrid_topic.eg_topic.name}-access-key"
  value        = azurerm_eventgrid_topic.eg_topic.primary_access_key
  key_vault_id = var.key_vault_id
}


