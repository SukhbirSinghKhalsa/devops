    resource "azurerm_storage_account" "this" {

      for_each = var.storage_accounts

      name = each.value.name

      resource_group_name = var.resource_group_ids[
        each.value.resource_group_key
      ].name

      location = var.resource_group_ids[
        each.value.resource_group_key
      ].location

      account_tier             = each.value.account_tier
      account_replication_type = each.value.replication_type

      min_tls_version = "TLS1_2"
    }