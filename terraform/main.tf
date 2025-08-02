# Configure the AzureRM Provider
# Configure the AzureRM Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0" # Use a suitable version
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.0" # Use an appropriate version
    }
  }
}

provider "azurerm" {
  features {}
}

# Call the network module
module "network" {
  source              = "./modules/network" # Path to the network module
  #resource_group_name = var.network_rg_name
  resource_group_name = "mynetwork-rg"
  location            = "southindia"
  prefix              = "qa"
  vnet_address_space  = ["10.0.0.0/16"]
  subnets = {
    "web" = "10.0.1.0/24"
    "app" = "10.0.2.0/24"
  }
}
