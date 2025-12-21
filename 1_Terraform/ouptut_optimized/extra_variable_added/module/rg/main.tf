variable "resource_group_reference" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}
resource "azurerm_resource_group" "resource_group" {
  for_each = var.resource_group_reference
  name     = each.value.resource_group_name
  location = each.value.location
}

# output "resource_group_output" {
#   value = { for k, rg in azurerm_resource_group.resource_group : k => {
#     name     = rg.name
#     location = rg.location
#     }
#   }
# }
output "resource_group_output" {
  value = { for k, rg in azurerm_resource_group.resource_group : k => rg  }
}
