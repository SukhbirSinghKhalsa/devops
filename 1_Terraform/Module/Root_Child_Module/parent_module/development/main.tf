module "resource_groups" {
  source       = "../../child_modules/resource_groups"
  rg_arguments = var.rg_arguments_setter
}

module "storage_accounts" {
  depends_on    = [module.resource_groups]
  source        = "../../child_modules/storage_accounts"
  stg_arguments = var.stg_arguments_setter
}

# output "rgidOutput" {
#   value = module.resource_groups.rgid
# }