variable "environment" {
  description = "Deployment environment"
}

variable "location_short" {

}
variable "system_name" {

}

variable "tags" {
  type    = map
  default = {}
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  default = "standard"
}

variable "key_vault_id" {

}