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

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"         # This RG will host your state storage
    storage_account_name = "tfstatestoragefree" # Must be globally unique
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# Create an Azure Resource Group 1
resource "azurerm_resource_group" "example1" {
  name     = ${random_pet.prefix.id}-rg
  location = var.location
  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Create an Azure Resource Group 2
resource "azurerm_resource_group" "example 2" {
  name     = ${random_pet.prefix.id}-rg
  location = var.location
  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}