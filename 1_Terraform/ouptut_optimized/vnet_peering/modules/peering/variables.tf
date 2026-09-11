variable "remote_virtual_network_id" {
  type = map(object({
    id = string
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