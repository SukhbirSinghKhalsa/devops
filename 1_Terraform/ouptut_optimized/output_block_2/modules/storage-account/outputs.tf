output "storage_account_ids" {
  value = {
    for key, storage in azurerm_storage_account.this :
    key => storage.id
  }
}
