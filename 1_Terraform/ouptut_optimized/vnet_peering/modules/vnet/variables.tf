variable "virtual_network" {
  type = map(object({
    name          = string
    rg_name       = string
    location      = string
    address_space = list(string)
  }))
}