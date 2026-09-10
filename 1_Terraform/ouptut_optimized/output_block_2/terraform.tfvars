resource_groups = {
  rg1 = {
    name     = "rg-dev"
    location = "Central India"
  }

  rg2 = {
    name     = "rg-prod"
    location = "East US"
  }
}

storage_accounts = {
  stg1 = {
    name               = "devstoragessk12345"
    resource_group_key = "rg1"
    account_tier       = "Standard"
    replication_type   = "LRS"
  }

  stg2 = {
    name               = "prodstoragessk12345"
    resource_group_key = "rg2"
    account_tier       = "Standard"
    replication_type   = "GRS"
  }
}
