/*
author          - https://github.com/SukhbirSinghKhalsa/
repository link - https://github.com/SukhbirSinghKhalsa/devops/tree/main/1_Terraform
*/

################ SIMPLE OUTPUT BLOCK ###################
/*
# uncomment for testing
resource "azurerm_resource_group" "resource_group" {
  name     = "ssk-inc-sandbox-rg"
  location = "Central India"
}

output "resource_group_basic" {
  value = azurerm_resource_group.resource_group.name
}

output "resource_group_list" {
  value = [
    azurerm_resource_group.resource_group.name,
    azurerm_resource_group.resource_group.location
  ]
}

output "resource_group_map" {
  value = {
    name     = azurerm_resource_group.resource_group.name
    location = azurerm_resource_group.resource_group.location
  }
}
*/

############################### OUTPUT FOR LIST #############################
/* 
# uncomment for testing
resource "azurerm_resource_group" "resource_group_list" {
  count    = 4
  name     = "ssk-inc-sandbox-rg${count.index}"
  location = "Central India"
}

output "resource_groups_lists" {
  value = azurerm_resource_group.resource_group_list[*]
}

output "resource_groups_lists_name" {
  value = azurerm_resource_group.resource_group_list[*].name
}
 */

############################## OUTPUT FOR MAP ###################################
# uncomment for testing
/* 
resource "azurerm_resource_group" "resource_group_map" {
  for_each = {
    rg1 = { name : "ssk-inc-sandbox-rg1", location : "Central India" }
    rg2 = { name : "ssk-inc-sandbox-rg2", location : "East US" }
    rg3 = { name : "ssk-inc-sandbox-rg3", location : "East US 2" }
  }
  name     = each.value.name
  location = each.value.location
}
output "resource_groups_map_op" {
  value = azurerm_resource_group.resource_group_map
}

# For Loop One Input and List Output with Resource Group Name 
output "resource_groups_map_1op" {
  value = [for rg in azurerm_resource_group.resource_group_map: rg.name]
}
output "resource_groups_map_1op_2ref" {
  value = [for iterator, rg in azurerm_resource_group.resource_group_map: { "${iterator}" = rg}]
}

# For Loop Two Input and List Output with Resource Group Name 
output "resource_groups_map_1stref_2op" {
  value = [for map_key, map_value in azurerm_resource_group.resource_group_map: map_key]
}

output "resource_groups_map_2ndref_2op" {
  value = [for map_key, map_value in azurerm_resource_group.resource_group_map: map_value]
}

# For Loop One Input and Map Output with Resource Group Name = Resource Group Location
output "resource_groups_map_2op" {
  value = {for map_value in azurerm_resource_group.resource_group_map: map_value.name => map_value.location}
}

# For Loop Two Inputs and Map Output with Iterator and Resource Group Location
output "resource_groups_map_2op_2refs" {
  value = {for iterator, map_value in azurerm_resource_group.resource_group_map: iterator => map_value.location}
}

# keys funcitons takes map as input and returns a list containing the keys
output "resource_groups_map_keys" {
  value = keys({for map_value in azurerm_resource_group.resource_group_map:  map_value.name => map_value.location})
}

# values funcitons takes map as input and returns a list containing the values
output "resource_groups_map_values" {
  value = values({for map_value in azurerm_resource_group.resource_group_map:  map_value.name => map_value.location})
}
*/
