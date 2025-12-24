# resource "azurerm_resource_group" "rg" {
#   name     = "rg"
#   location = "central india"
# }
# resource "azurerm_resource_group" "rg1" {
#   name     = "rg1"
#   location = "central india"
# }
# resource "azurerm_resource_group" "rg2" {
#   name     = "rg2"
#   location = "central india"
# }
# resource "azurerm_resource_group" "rg3" {
#   name     = "rg3"
#   location = "central india"
# }

variable "temp" {
  default = {
    "rg"  = {name: "rg", location:"centralindia"}
    "rg1" = {name: "rg1", location:"centralindia"}
    "rg2" = {name: "rg2", location:"centralindia"}
    "rg3" = {name: "rg3", location:"centralindia"}
  }
}
resource "azurerm_resource_group" "resource_group" {
  for_each = var.temp
  name     = each.value.name
  location = each.value.location
}

# moved {
#   from = azurerm_resource_group.rg
#   to   = azurerm_resource_group.resource_group["rg"]
# }
# moved {
#   from = azurerm_resource_group.rg1
#   to   = azurerm_resource_group.resource_group["rg1"]
# }
# moved {
#   from = azurerm_resource_group.rg2
#   to   = azurerm_resource_group.resource_group["rg2"]
# }
# moved {
#   from = azurerm_resource_group.rg3
#   to   = azurerm_resource_group.resource_group["rg3"]
# }
