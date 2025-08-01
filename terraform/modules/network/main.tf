# Creates the resource group for network resources if it doesn't exist
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Creates a Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space
}

# Creates subnets within the VNet using a for_each loop
resource "azurerm_subnet" "subnet" {
  for_each             = var.subnets # Iterates over the map of subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value] # Each subnet gets its own address prefix
}