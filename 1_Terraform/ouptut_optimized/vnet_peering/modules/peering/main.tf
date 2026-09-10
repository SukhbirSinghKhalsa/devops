resource "azurerm_virtual_network_peering" "virtual_network_peering" {
  for_each                  = var.virtual_network_peering_map_object
  name                      = each.value.name
  resource_group_name       = each.value.rg_name
  virtual_network_name      = each.value.vnet_name
  remote_virtual_network_id = var.remote_virtual_network_id[each.value.remote_vnet_key].id
  allow_gateway_transit     = false
}
