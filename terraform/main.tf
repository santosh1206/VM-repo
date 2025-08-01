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

# Call the storage module
module "storage" {
  source               = "./modules/storage" # Path to the storage module
  #resource_group_name  = var.storage_rg_name
  resource_group_name = "mystorageacc-rg"
  #location             = var.location
  location            = "southindia"
  prefix              = "qa"
  # Storage account names must be globally unique and lowercase.
  # Using random_string to ensure uniqueness.
  storage_account_name = "qastor${random_string.suffix.result}"
}

# Call the webapp module
module "webapp" {
  source              = "./modules/webapp" # Path to the webapp module
  #resource_group_name = var.webapp_rg_name
  resource_group_name = "mywebapp-rg"
  #location            = var.location
  location            = "southindia"
  #prefix              = var.prefix
  prefix              = "qa"
}

# Resource to generate a random suffix for unique naming (e.g., for storage accounts)
resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}