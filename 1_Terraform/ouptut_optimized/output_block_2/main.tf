  provider "azurerm" {
    features {}
  }

  module "resource_group" {
    source = "./modules/resource-group"

    resource_groups = var.resource_groups
  }

  module "storage_account" {
    source = "./modules/storage-account"

    storage_accounts   = var.storage_accounts
    resource_group_ids = module.resource_group.resource_group_ids
  }
