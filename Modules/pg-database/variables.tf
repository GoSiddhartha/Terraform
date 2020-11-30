variable "resource_group_name" {
  description = "Name of the ressource group in which the storage account shall reside"
}

variable "db_name" {
  description = "name of the database"
  default     = "West Europe"
}

variable "server_name" {
  type = string
}

variable "db_charset" {
  type = string
}

variable "db_collation" {
  type = string
}

variable "server_login" {
  type = string
}

variable "server_password" {
  type = string
}