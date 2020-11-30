variable "resource_group_name" {
  description = "Name of the ressource group in which the storage account shall reside"
}

variable "location" {
  description = "The Azure Region"
  default     = "West Europe"
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

