resource "azurerm_resource_group" "rg" {
  name     = "GF-RG-${upper(var.system_name)}-${upper(var.environment)}-${upper(var.location_short)}"
  location = var.location

  tags = var.tags

  lifecycle {
    ignore_changes = [
      tags["GfCategory"],
      tags["GfDescription"]
    ]
  }
}