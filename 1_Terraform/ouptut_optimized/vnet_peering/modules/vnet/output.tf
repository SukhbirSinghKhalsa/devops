output "vnet_ids" {
  value = {
    for key, vnet in azurerm_virtual_network.this :
    key => {
      id                = vnet.id
    }
  }
}