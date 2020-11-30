variable "containers" {
  type = list(object({
    name                  = string
    container_access_type = string
    service_name          = string
  }))
  default = []
}

variable "sa_name" {

}

variable "key_vault_id" {

}