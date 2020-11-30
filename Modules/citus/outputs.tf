output "coordinator_hostname" {
  value     = var.deploy_citus ? lookup(azurerm_template_deployment.postgresql_hyperscale_citus[0].outputs, "coordinator hostname") : random_password.citus_pswd.result
  sensitive = false
}
