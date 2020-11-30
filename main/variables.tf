variable "client_id" {
  description = "client_id"
}

variable "client_secret" {
  description = "client_secret"
}

variable "subscription_id" {
  description = "subscription id"
}

variable "tenant" {
  description = "tenant"
}

variable "location" {

}
variable "environment" {

}

variable "suffix" {
  default = ""
}

variable "kv_sku_name" {
  default = "standard"
}

variable "map_sku_name" {
  default = "S1"
}

variable "account_tier" {
  default = "Standard"
}

variable "account_kind" {
  default = "StorageV2"

}
variable "account_replication_type" {
  default = "LRS"
}

variable "containers" {
  type = list(object({
    name                  = string
    container_access_type = string
    service_name          = string
  }))
  default = []
}

variable "access_policies" {
  type = list(object({
    object_id          = string
    key_permissions    = list(string)
    secret_permissions = list(string)
  }))

  default = []
}

variable "sp_owners" {
  type = list
  
  default = []
}

variable "location_short" {

}
variable "project" {

}

variable "storagelog" {
  type    = string
  default = "ragelog"
}

variable "tags" {
  type    = map
  default = {}
}

variable "citustags" {
  type = map(string)

  default = {}
}


variable "webhook_url" {
  type = string
}


variable "administrator_login" {
  type = string
}

variable "server_group" {
  type = string
}

variable "coordinator_vcores" {
  type = number
}

variable "coordinator_storage_sizeMB" {
  type = number
}

variable "worker_storage_sizeMB" {
  type = number
}

variable "num_workers" {
  type = number
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
  type = number
}

variable "vnet_data" {
  type = map

  default = {}
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

variable "pg_telemetry_tablename" {
  type    = string
  default = "telemetry"
}

variable "pg_telemetry_channelname" {
  type    = string
  default = "telemetrychanged"
}

variable "pg_telemetry_change_table" {
  type    = string
  default = "telemetrychanges"
}

variable "pg_telemetry_migrations" {
  type    = string
  default = "telemetry_migrations"
}

variable "pg_meta_table" {
  type    = string
  default = "metadocs"
}

variable "pg_meta_channel" {
  type    = string
  default = "metadocs_changed"
}

variable "pg_meta_migrations" {
  type    = string
  default = "meta_migrations"
}

variable "rm_connection" {
  type    = string
  default = "amqps://qnglkcpn:IcV96k3QXHVUt3MxpENG-AVvILSsAAoh@turkey.rmq.cloudamqp.com/qnglkcpn"
}

variable "rm_datachangedexchange" {
  type    = string
  default = "wwnc.events"
}

variable "rm_datachangedroutingkey" {
  type    = string
  default = "datachanged"
}

variable "sp_name" {
  type = string
}

variable "ui_client_id" {
  type = string
}

variable "asset_env" {
  type = string
}

locals {
  asserfacade_uri        = "https://internaltoolsassetapi-${var.asset_env}.grundfos.com"
  map_account_uri        = "https://atlas.microsoft.com"
}