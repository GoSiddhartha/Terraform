output "id" {
  value = azurerm_eventgrid_topic.eg_topic.id
}

output "endpoint" {
  value = azurerm_eventgrid_topic.eg_topic.endpoint
}

output "primary_access_key" {
  value = azurerm_eventgrid_topic.eg_topic.primary_access_key
}

output "secondary_access_key" {
  value = azurerm_eventgrid_topic.eg_topic.secondary_access_key
}

output "subscription_id" {
  value = azurerm_eventgrid_event_subscription.eg_sub.id
}