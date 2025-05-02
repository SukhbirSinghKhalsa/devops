#research work for curious learners like you
# 1 when is state file first created?
# 2 create backend block with 2 different modules

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  subscription_id = "e2b21bd3-23b3-43c2-a854-a8c3e3fad269"
}
