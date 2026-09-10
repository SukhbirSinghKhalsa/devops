module "virtual_network" {
  source          = "../modules/vnet"
  virtual_network = var.virtual_network
}

module "virtual_network_peering" {
  source                             = "../modules/peering"
  virtual_network_peering_map_object = var.virtual_network_peering_map_object
  remote_virtual_network_id          = module.virtual_network.vnet_ids
}

variable "virtual_network" {}
variable "virtual_network_peering_map_object" {}
provider "azurerm" {
  features {  }
}
