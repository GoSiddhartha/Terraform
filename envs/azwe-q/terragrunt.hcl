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
      key                  = "grmnext-infra/azwe-q/terraform.tfstate"
      resource_group_name  = local.resource_group_name
      subscription_id      = local.subscription
    }
}

inputs = {
    location            = "westeurope"
    location_short      = "azwe"
    environment         = "q"
    tags = {
        Name  = "grmnext-infrastructure"
        Env   = "q"
        Owner = "wwnc"
    }
    containers = [
      {
        name                  = "eventhub"
        container_access_type = "private"
        service_name          = "ehadapter"  
      }
    ]
    project = "grmninfra"
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
    administrator_login = "citus"
    server_group = "gfcitus-grmnext-q-azwe"
    coordinator_vcores = 4
    coordinator_storage_sizeMB = 524288
    worker_vcores = 4
    worker_storage_sizeMB = 524288
    num_workers = 2
    standby_count = 0
    vnet_data = {}
    deploy_citus = false
    db_name = "citus"
}
