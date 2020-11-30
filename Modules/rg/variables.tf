variable "environment" {
  description = "Deployment environment"
}

variable "location" {
  description = "The location the ressources belong to (West Europe)"
}

variable "location_short" {

}
variable "system_name" {

}

variable "tags" {
  type    = map
  default = {}
}