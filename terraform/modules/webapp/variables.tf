variable "resource_group_name" {
  description = "Name of the resource group for web app resources."
  type        = string
}

variable "location" {
  description = "Azure region for resources."
  type        = string
}

variable "prefix" {
  description = "Prefix for naming web app resources."
  type        = string
}