locals {
  storage_account_name = "gfstotfbackendpazwe"
  resource_group_name  = "GF-RG-TFBACKEND-P-AZWE"
  subscription         = "31408ddb-374b-49bd-9c0a-850bc6086bd3" # GiCv2-P
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
      key                  = "grmnext-infra/azwe-p/terraform.tfstate"
      resource_group_name  = local.resource_group_name
      subscription_id      = local.subscription
    }
}

inputs = {
    location            = "westeurope"
    location_short      = "azwe"
    environment         = "p"
    tags = {
        Name  = "grmnext-infrastructure"
        Env   = "p"
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
    }
  ]
}
