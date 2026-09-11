
output "resource_group_ids" {
  value = {
    for key, rg in azurerm_resource_group.this :
    key => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}