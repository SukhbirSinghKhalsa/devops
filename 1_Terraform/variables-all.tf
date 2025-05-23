#Variables are the memory block used to temporarily store our values
# It can works as placeholder for our dynamic or static values

# It can be of different datatypes 
# String, Number, Boolean, List, Set, Map are some of them

# In Terraform, variable is block with all optional arguments such as type, defination, default and others



# ---------------------------------variable of type string
variable "rg-name-string" {
  type    = string
  default = "rg-sandbox-001"
}
resource "azurerm_resource_group" "name-str" {
  name     = var.rg-name-string
  location = "central india"
}


# ---------------------------------variable of type number
variable "rg-name-number" {
  type    = number
  default = 1
}
resource "azurerm_resource_group" "name-number" {
  name     = "rg-sandbox-${var.rg-name-number}" #string interpolation/concatination
  location = "east us"
}


# ---------------------------------variable of type boolean
variable "rg-name-boolean" {
  type    = bool
  default = true
}
resource "azurerm_resource_group" "name-bool" {
  name     = "rg-prepod-${var.rg-name-boolean}"
  location = "central india"
}


# ---------------------------------variable of type list
variable "rg-name-list" {
  type    = list(any)
  default = ["mehdi-bhai", "east us", "oves-bhai", "west us", "1", 4, 5, "7Mehdi", true]
}
resource "azurerm_resource_group" "name-list" {
  name     = var.rg-name-list[0]
  location = var.rg-name-list[1]
}


# ---------------------------------variable of type set
variable "rg-name-set" {
  type    = set(any)
  default = ["mehdi-bhai", "mehdi-bhai", "west us", "1", 4, 5, "7Mehdi", true]
}
resource "azurerm_resource_group" "name-set" {
  name     = var.rg-name-list[0]
  location = var.rg-name-list[1]
}


# ---------------------------------variable of type map
variable "rg-name-map" {
  type = map(any)
  default = {
    rg_name  = "rg-prod-001"
    location = "west us"
  }
}
resource "azurerm_resource_group" "name-map" {
  name = var.rg-name-map.rg_name
  location = var.rg-name-map.location
}

