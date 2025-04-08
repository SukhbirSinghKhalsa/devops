#home work
# 1 when is state file first created?
# 2 create backend block with 2 different modules

terraform {
  required_providers {
    azurerm = {
        source= "hashicorp/azurerm"
        version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {  }
  subscription_id = ""
}

module "swapnil" {
  source = "./rg"
}

module "abhay" {
    depends_on = [ module.swapnil ]
  source = "./stg"
}