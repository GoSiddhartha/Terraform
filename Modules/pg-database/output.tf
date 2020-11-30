output "database_ids" {
  description = "The list of all database resource ids"
  value       = [azurerm_postgresql_database.dbs.*.id]
}