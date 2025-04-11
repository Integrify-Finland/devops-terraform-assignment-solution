terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options

  features {

  }

  
  subscription_id = "50cff209-0e41-4560-a131-5c873ec03be0"
}