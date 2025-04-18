resource "azurerm_storage_account" "storage_account" {
  name = "stgssk001"
  location = "west us"
  resource_group_name = "rg-prod-001"
  account_tier = "Standard"
  account_replication_type = "LRS"
}