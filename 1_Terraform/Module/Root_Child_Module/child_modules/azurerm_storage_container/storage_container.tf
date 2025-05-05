resource "azurerm_storage_container" "storage_container" {
  for_each              = var.stg_container_arguments
  name                  = each.value.stg_container_name
  storage_account_id    = each.value.stg_container_id
  container_access_type = "private"

}
