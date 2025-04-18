#meta argument -- count
# index starts from 0
# to access index of count meta_agrument--> count.index
# no flexibility of changing names
# no flexibikity in deletion also, may need to delete all the resources


#COUNT meta_argument demonstration with String Interpolation (concatination)
resource "azurerm_resource_group" "resource_group" {
  count    = 2
  name     = "rg-prod-${count.index}" #String Interpolation
  location = "central india"
}


#list converted to set to iterate it and used with for each to create 3 resource groups
resource "azurerm_resource_group" "resource_group_1" {
  for_each = toset(["1", "2", "3"])
  name     = "rg-sandbox-00${each.value}"
  location = "west us"
}

#Basic Map with 2 key value pairs and used with for each t create 2 resouce groups
resource "azurerm_resource_group" "resource_group_2" {
  for_each = {
    rg-prod-001 = "east us"
    rg-prod-002 = "west us"
  }
  name     = each.key   #all the keys
  location = each.value #all the values
}

#map with 2 maps inside it  and used with for each to create 2 resource groups
resource "azurerm_resource_group" "resource_group_1" {
  for_each = {
    rg1 = {
      mehdi = "ssk"
      loc   = "west us"
    },
    rg2 = {
      mehdi = "mehdi-bhai"
      loc   = "central india"
    }
  }
  name     = each.value.mehdi
  location = each.value.loc
}



































# resource "azurerm_resource_group" "resource_group" {
#   for_each = toset(["sukhi","mehdi"]) # var.rg-list
#   name = each.value
#   location = "central india"
# }
