module "resource_groups" {
  source       = "../../child_modules/resource_groups"
  rg_arguments = var.rg_arguments_setter
}

module "storage_accounts" {
  depends_on    = [module.resource_groups]
  source        = "../../child_modules/storage_accounts"
  stg_arguments = var.stg_arguments_setter
}


#problem statement -  Need to reuse resource block in different Environments

# resource "azurerm_resource_group" "resource_group_0" {
#   name     = "rg-sandbox-test-001" #fixed value -- problem
#   location = "Central India"
# }

#How can you make it dynamic that it can be changed as per different environments like prod, dev, sandbox?
#Modular approach -- Using Root Child Module
#Using terraform.tfvars from Root module to keep Variables dynamic as per the different environments 
#VARIABLES is the solution

# variable "rg-name" {} # Varaible Declaration
# variable "rg-location" {}

# resource "azurerm_resource_group" "resource_group" {
#   name     = var.rg-name #variable to get the values
#   location = var.rg-location
# }

#now it is able to take values from command line arguments,
# to enhance it more we use terraform.tfvars file in root modules