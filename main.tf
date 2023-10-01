terraform {

  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

locals {
  tags = {
    "Environment" = var.environment
  }
}

resource "azurerm_storage_account" "securestorage" {
  resource_group_name      = var.resource_group_name
  location                 = var.location
  name                     = var.storage_account_name
  account_tier             = "Standard"
  account_replication_type = var.environment == "Production" ? "GRS" : "LRS"


  tags = local.tags
}
