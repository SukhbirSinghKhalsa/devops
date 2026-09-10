virtual_network = {
  vnet1 = {
    name          = "peternetwork1"
    rg_name       = "rg1"
    location      = "centralindia"
    address_space = ["10.0.1.0/24"]
  }

  vnet2 = {
    name          = "peternetwork2"
    rg_name       = "rg2"
    location      = "centralindia"
    address_space = ["10.0.2.0/24"]
  }
}

virtual_network_peering_map_object = {
  peering1 = {
    name            = "vnet1-vnet2-peering"
    rg_name         = "rg1"
    vnet_name       = "peternetwork1"
    remote_vnet_key = "vnet2"
  }
  peering2 = {
    name            = "vnet2-vnet1-peering"
    rg_name         = "rg2"
    vnet_name       = "peternetwork2"
    remote_vnet_key = "vnet1"
  }
}
