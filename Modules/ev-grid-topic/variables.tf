variable "system_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "d"
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type    = map
  default = {}
}

variable "key_vault_id" {
  type = string
}

variable "webhook_url" {
  type = string
}