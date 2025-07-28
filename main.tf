# Configure the AzureRM Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0" # Use a suitable version
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

# Create an Azure Resource Group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}