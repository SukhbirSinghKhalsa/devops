output "rgid" {
  value = "azurerm_resource_group.resource_group.id"
}

# data "azurerm_resource_group" "shared" {
#   name = "rg-prod-001-ssk"
# }

# resource "azurerm_resource_group" "shared" {
#   name     = data.azurerm_resource_group.shared.name
#   location = data.azurerm_resource_group.shared.location
# }
