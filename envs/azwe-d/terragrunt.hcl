locals {
  storage_account_name = "gfstotfbackenddazwe"
  resource_group_name  = "GF-RG-TFBACKEND-D-AZWE"
  subscription         = "72e2f1e3-91e1-4bd9-9b3d-cd2e9e422501" # GiCv2-D
}

terraform {
  source = "../..//main"
}

remote_state {
    backend  = "azurerm"

    generate = {
      path      = "backend.tf"
      if_exists = "overwrite_terragrunt"
    }
    
    config = {
      storage_account_name = local.storage_account_name
      container_name       = "tfstate"
      key                  = "wwnc-infra/azwe-d/terraform.tfstate"
      resource_group_name  = local.resource_group_name
      subscription_id      = local.subscription
    }
}

inputs = {
    location            = "westeurope"
    location_short      = "azwe"
    environment         = "d"
    asset_env           = "q"
    tags = {
        Name  = "wwnc-infrastructure"
        Env   = "d"
        Owner = "wwnc"
    }
    citustags = {
        "owner" = "wwnc"
    }
    containers = [
      {
        name                  = "eventhub"
        container_access_type = "private"
        service_name          = "ehadapter"  
      }
    ]
    project = "wwncinfra"
    webhook_url = "https://gf-web-evwebhook-x1-azwe.azurewebsites.net/api/EventGridEventHandler"
    access_policies = [
      {
        object_id          = "875075cd-b0b4-48f9-8e9d-5b4c35d65006"
        key_permissions     = ["get", "list", "purge", "delete"]
        secret_permissions = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
      },
      {
        object_id          = "aea6433b-85f8-40b1-9e71-4d490978e51b" #devone cluster
        key_permissions    = ["create", "get", "list"]
        secret_permissions = ["set", "get", "list", "delete"]
      },
      {
        object_id          = "f5da29ef-f4a3-47be-8e42-4d0b339afdb3" #opsone cluster
        key_permissions    = ["create", "get", "list"]
        secret_permissions = ["set", "get", "list", "delete"]
      },
      {
        object_id          = "7705f0d5-5438-4735-84c9-5275aa0427bc" #devtwo cluster
        key_permissions    = ["create", "get", "list"]
        secret_permissions = ["set", "get", "list", "delete"]
      }
    ]
    firewall_rules = [
      {
        name       = "gf-vpn"
        start_ip   = "193.3.10.0"
        end_ip     = "193.3.10.255"
      },
      {
        name       = "vmssagentspool"
        start_ip   = "20.50.254.192"
        end_ip     = "20.50.254.207"
      }
    ]
    sp_owners = ["7d9b017a-fc24-4a3a-83fa-5192d832f4c0","4cc912ba-6760-4055-873f-5a771f02a152"]
    suffix              = "_d"
    ui_client_id        = "00a51e02-4b69-4b0b-b11c-6a978517aff6"
    administrator_login = "wwnccitusadmin"
    server_group = "gfcitus-wwnc-d-azwe"
    coordinator_vcores = 4
    coordinator_storage_sizeMB = 524288
    worker_vcores = 4
    worker_storage_sizeMB = 524288
    num_workers = 2
    standby_count = 0
    vnet_data = {}
    deploy_citus = false
    db_name = "citus"
    sp_name = "sp-wwnc-d"
    create_sp = true
}
