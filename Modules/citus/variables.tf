variable "resource_group_name" {
  type = string
}

variable "administrator_login" {
  type    = string
  default = "citus"
}

variable "location" {
  type = string
}

variable "server_group" {
  type = string
}

variable "coordinator_vcores" {
  type    = number
  default = 4
}

variable "coordinator_storage_sizeMB" {
  type    = number
  default = 524288
}

variable "workerVcores" {
  type    = number
  default = 4
}

variable "worker_storage_sizeMB" {
  type    = number
  default = 524288
}

variable "num_workers" {
  type    = number
  default = 2
}

variable "tags" {
  type = map(string)

  default = {}
}

variable "firewall_rules" {
  type = object({
    rules = list(map(string))
  })

  default = {
    rules = [
      {
        "name"           = "gf-vpn",
        "startIPAddress" = "193.3.10.0",
        "endIPAddress"   = "193.3.10.255",
      },
      {
        "name"           = "vmssagentspool",
        "startIPAddress" = "20.50.254.192",
        "endIPAddress"   = "20.50.254.207",
      }
    ]
  }
}

variable "standby_count" {
  type    = number
  default = 0
}

variable "vnet_data" {
  type = map

  default = {}
}

variable "key_vault_id" {
  type = string
}

variable "deploy_citus" {
  type = bool
}

variable "db_name" {
  type = string
}

variable "worker_vcores" {
  type = number
}
