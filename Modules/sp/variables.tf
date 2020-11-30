variable "name" {
  description = "name of the service principal"
}

variable "sp_owners" {
  type = list

  default = []
}