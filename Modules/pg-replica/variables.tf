variable "resource_group_name" {
  description = "Name of the ressource group in which the storage account shall reside"
}

variable "location" {
  description = "The Azure Region"
  default     = "West Europe"
}

variable "sku_name"{
  type = string
}

variable "storage_mb" {
  
}

variable "backup_retention_days" {
  
}

variable "geo_redundant_backup_enabled" {
  
}

variable "auto_grow_enabled" {
  
}

variable "user_name" {
  type = string
}

variable "version" {
  
}

variable "ssl_enforcement_enabled" {
  
}

variable "account_tier" {
  default = "Standard"
}

variable "account_kind" {
  
}

variable "is_hns_enabled" {
  default = "false"
}

variable "account_replication_type" {
  default = "LRS"
}

variable "system_name" {

}

variable "key_vault_id" {

}

variable "environment" {

}

variable "tags" {
  type    = map
  default = {}
}

variable "postgresql_configurations" {
  description = "A map with PostgreSQL configurations to enable."
  type        = map(string)
  default     = {}
}

variable "access_policies" {
  type = list(object({
    name      = string
    start_ip  = string
    end_ip    = string
  }))

  default = []
}

