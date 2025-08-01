variable "resource_group_name" {
  description = "Name of the resource group for storage resources."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique)."
  type        = string
}
variable "prefix" {
  description = "Prefix for naming network resources."
  type        = string
  default    = "qa"
}