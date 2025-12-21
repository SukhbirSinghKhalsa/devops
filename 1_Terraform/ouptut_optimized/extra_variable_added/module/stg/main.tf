resource "azurerm_storage_account" "storage_account" {
  for_each                 = var.storage_account_reference
  name                     = each.value.storage_account_name
  resource_group_name      = var.resource_group_reference[each.value.rg_key].name
  location                 = var.resource_group_reference[each.value.rg_key].location
  account_tier             = each.value.storage_account_access_tier
  account_replication_type = each.value.storage_account_replication_type
}

variable "storage_account_reference" {
  type = map(object({
    storage_account_name              = string
    storage_account_access_tier       = string
    storage_account_replication_type  = string
    rg_key                            = string
  }))
}

variable "resource_group_reference" {
  type = map(object({
    name     = string
    location = string
  }))
}
output "storage_account_output" {
  value = { for k, stg in azurerm_storage_account.storage_account : k => stg  }
}
