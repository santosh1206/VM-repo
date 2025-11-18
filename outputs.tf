## 4. Output
output "public_ip_address" {
  description = "The public IP address of the deployed VM."
  value       = azurerm_public_ip.pip.ip_address
}
