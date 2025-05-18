#meta argument -- count
# index starts from 0
# to access index of count meta_agrument--> count.index
# no flexibility of changing names
# no flexibikity in deletion also, may need to delete all the resources

#---------------------------start of Count loop
#COUNT meta_argument and count.index object
resource "azurerm_resource_group" "resource_group" {
  count    = 4
  name     = count.index #iterator
  location = "central india"
}


#COUNT meta_argument demonstration with String Interpolation (concatination)
resource "azurerm_resource_group" "resource_group" {
  count    = 2
  name     = "rg-prod-${count.index}" #String Interpolation
  location = "central india"
}


variable "list-of-rg" {
  type    = list(string)
  default = ["rg-prod-001", "rg-dev-001", "rg-sandbox-001"]
}
#COUNT meta_argument with variable of type list and accessing list element
resource "azurerm_resource_group" "resource_group" {
  count    = 3
  name     = var.list-of-rg[0] #String Interpolation
  location = "central india"
}


#COUNT meta_argument with variable of type list + length function for dynamic execution
resource "azurerm_resource_group" "resource_group" {
  count    = 3
  name     = var.list-of-rg[count.index] #String Interpolation
  location = "central india"
}


#COUNT meta_argument with variable of type list + length function for dynamic execution
resource "azurerm_resource_group" "resource_group" {
  count    = length(var.list-of-rg)
  name     = var.list-of-rg[count.index] #String Interpolation
  location = "central india"
}
#---------------------------start of Count loop



#---------------------------start of for_each loop
variable "list-of-rgs" {
  default = ["rg-prod-001", "rg-dev-001", "rg-sandbox-001"]
}

#list to iterate for_each errored out -PROBLEM
# resource "azurerm_resource_group" "resource_group_1" {
#   for_each = var.list-of-rgs
#   name     = each.value
#   location = "west us"
# }


#- SOLUTION1 - list converted to set to iterate it and used with for each to create 3 resource groups 
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
      resource_group_name = "ssk"
      loc   = "west us"
    },
    rg2 = {
      resource_group_name = "mehdi-bhai"
      loc   = "central india"
    }
  }
  name     = each.value.resource_group_name
  location = each.value.loc
}



































# resource "azurerm_resource_group" "resource_group" {
#   for_each = toset(["sukhi","mehdi"]) # var.rg-list
#   name = each.value
#   location = "central india"
# }
