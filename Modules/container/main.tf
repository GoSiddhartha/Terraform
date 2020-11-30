resource "azurerm_storage_container" "blob_container" {
  count = length(var.containers)

  name                  = var.containers[count.index]["name"]
  storage_account_name  = var.sa_name
  container_access_type = var.containers[count.index]["container_access_type"]
}

resource "azurerm_key_vault_secret" "connection_string_secret" {
  count = length(var.containers)

  name         = "${var.containers[count.index]["service_name"]}-blobcontainer-name"
  value        = var.containers[count.index]["name"]
  key_vault_id = var.key_vault_id
}