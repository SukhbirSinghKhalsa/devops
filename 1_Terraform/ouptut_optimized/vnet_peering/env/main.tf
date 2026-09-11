 module "resource_group" {
    source = "../modules/resource-group"
    resource_groups = var.resource_groups
  }


module "virtual_network" {
  source          = "../modules/vnet"
  virtual_network = var.virtual_network
  depends_on = [ module.resource_group ]
}

module "virtual_network_peering" {
  source                             = "../modules/peering"
  virtual_network_peering_map_object = var.virtual_network_peering_map_object
  remote_virtual_network_id          = module.virtual_network.vnet_ids
  depends_on = [ module.virtual_network ]
}

variable "virtual_network" {
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}
variable "virtual_network_peering_map_object" {
  type = map(object({

    name            = string
    rg_name         = string
    vnet_name       = string
    remote_vnet_key = string
  }))
}
provider "azurerm" {
  features {}
}
variable "resource_groups" {
}

