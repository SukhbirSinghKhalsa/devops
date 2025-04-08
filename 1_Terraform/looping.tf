#meta argument -- count
# index starts from 0
# to access index of count meta_agrument--> count.index
# no flexibility of changing names
# no flexibikity in deletion also, may need to delete all the resources

resource "azurerm_resource_group" "resource_group" {
  count    = 2 #2 --> 1 after creation of 2 rgs
  name     = "rg-prod-${count.index}"
  location = "central india"
}


#list converted to set and used with for each
resource "azurerm_resource_group" "resource_group_1" {
  for_each = toset(["1","2","3"])
  name = each.value
  location = "west us"
}

#map with 2 maps inside it  and used with for each
resource "azurerm_resource_group" "resource_group_2" {
  for_each = {
      mehdi = "east us"
      loc   = "west us"
  }
  name     = each.key
  location = each.value
}

#map with 2 maps inside it  and used with for each
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
