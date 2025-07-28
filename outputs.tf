output "resource_group_id" {
  description = "The ID of the created Resource Group."
  value       = azurerm_resource_group.example.id
}

output "resource_group_location" {
  description = "The location of the created Resource Group."
  value       = azurerm_resource_group.example.location
}