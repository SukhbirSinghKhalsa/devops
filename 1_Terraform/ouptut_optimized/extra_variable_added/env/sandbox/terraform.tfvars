resource_group_map = {
  rg1 = {
    resource_group_name = "ssk-inc-sandbox-inc"
    location            = "Central India"
  }
  rg2 = {
    resource_group_name = "ssk-inc-sandbox-inc2"
    location            = "East US"
  }
  rg3 = {
    resource_group_name = "ssk-inc-sandbox-inc3"
    location            = "East US 2"
  }
}

storage_account_map = {
  stg = {
    storage_account_name             = "sskincstg1234"
    # --> rg_key should match the key of resource_group_map oject eg rg1 | rg2 | rg3
    rg_key                           = "rg1" 
    storage_account_access_tier      = "Standard"
    storage_account_replication_type = "LRS"
  }
}
