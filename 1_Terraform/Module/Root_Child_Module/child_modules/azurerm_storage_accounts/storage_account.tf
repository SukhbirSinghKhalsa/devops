resource "azurerm_storage_account" "storage_account" {
  for_each                 = var.stg_arguments
  name                     = each.value.stg_name
  location                 = each.value.location
  resource_group_name      = each.value.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
