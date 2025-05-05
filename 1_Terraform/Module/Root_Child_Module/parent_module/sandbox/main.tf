module "resource_groups" {
  source       = "../../child_modules/azurerm_resource_group"
  rg_arguments = var.rg_arguments_setter
}

module "storage_accounts" {
  depends_on    = [module.resource_groups]
  source        = "../../child_modules/azurerm_storage_account"
  stg_container_arguments = var.stg_arguments_setter
}

module "storage_container" {
  depends_on    = [module.storage_accounts]
  source        = "../../child_modules/azurerm_storage_container"
  stg_container_arguments = var.stg_container_arguments_setter
}
