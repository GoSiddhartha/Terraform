resource "random_password" "citus_pswd" {
  length           = 32
  special          = true
  override_special = "_%@"
}

resource "azurerm_template_deployment" "postgresql_hyperscale_citus" {
  count = var.deploy_citus ? 1 : 0

  name                = "hyperscale-citus"
  resource_group_name = var.resource_group_name

  template_body   = file("../Modules/citus/template.json")
  deployment_mode = "Incremental"
  parameters = {
    administratorLogin         = var.administrator_login
    administratorLoginPassword = random_password.citus_pswd.result
    location                   = var.location
    serverGroup                = var.server_group
  }
}

resource "azurerm_key_vault_secret" "connection_string_secret" {
  count = var.deploy_citus ? 1 : 0

  name         = "${var.server_group}-connection-string"
  value        = "Server=${lookup(azurerm_template_deployment.postgresql_hyperscale_citus[0].outputs, "coordinator hostname")};Database=${var.db_name};Port=5432;User Id=${var.administrator_login};Password=${random_password.citus_pswd.result};Ssl Mode=Require;"
  key_vault_id = var.key_vault_id

  depends_on = [
    azurerm_template_deployment.postgresql_hyperscale_citus
  ]
}
