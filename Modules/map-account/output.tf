output "id" {
  description = "Id of the azure map account"
  value       = azurerm_maps_account.maps.id
}

output "primary_access_key" {
  description = "primary acces key of the azure map account"
  value       = azurerm_maps_account.maps.primary_access_key
}

output "secondary_access_key" {
  description = "Secondary acces key of the azure map account"
  value       = azurerm_maps_account.maps.secondary_access_key
}

output "client_id" {
  description = "Client id of the azure map account"
  value       = azurerm_maps_account.maps.x_ms_client_id 
}