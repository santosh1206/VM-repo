variable "resource_group_name" {
  description = "The name of the Azure Resource Group to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = "centralindia" # Default location, can be overridden by pipeline variables
}

variable "environment" {
  description = "The environment for the resource group (e.g., dev, prod)."
  type        = string
  default     = "dev" # Default environment, can be overridden
}

variable "prefix" {
  type        = string
  default     = "trainingdev"
  description = "Prefix of the resource name"
}
