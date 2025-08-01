output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the created Virtual Network."
}

output "subnet_ids" {
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
  description = "A map of subnet names to their IDs."
}