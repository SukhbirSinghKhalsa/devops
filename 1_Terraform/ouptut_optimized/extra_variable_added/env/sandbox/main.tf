module "rg" {
  source                   = "../../module/rg"
  resource_group_reference = var.resource_group_map
}
module "stg" {
  depends_on                = [module.rg]
  source                    = "../../module/stg"
  storage_account_reference = var.storage_account_map
  resource_group_reference  = module.rg.resource_group_output
}


variable "resource_group_map" {}

variable "storage_account_map" {
  type = map(object({
    storage_account_name              = string
    storage_account_access_tier       = string
    storage_account_replication_type  = string
    rg_key                            = string
  }))
}

provider "azurerm" {
  features {}
  subscription_id = ""
}

output "resource_group_test" {
  value = module.rg.resource_group_output
}
output "storage_account_test" {
  value = module.stg.storage_account_output
  sensitive = true
}