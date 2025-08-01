variable "resource_group_name" {
  description = "Name of the resource group for network resources."
  type        = string
  default     = "def-qanetwork-rg"
}

variable "location" {
  description = "Azure region for resources."
  type        = string
  default    = "southindia"
}

variable "prefix" {
  description = "Prefix for naming network resources."
  type        = string
  default    = "net"
}

variable "vnet_address_space" {
  description = "Address space for the VNet."
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnet names to their address prefixes."
  type        = map(string)
}