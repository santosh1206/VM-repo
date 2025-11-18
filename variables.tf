# --- Variables (Recommended Practice) ---
variable "resource_group_name" {
  default = "vm-rg-custom-disk"
}
variable "location" {
  default = "East US"
}
variable "vm_name" {
  default = "custom-disk-linux-vm"
}
variable "disk_name" {
  default = "my-custom-os-disk-tf" # Your desired OS Disk name
}
variable "admin_username" {
  default = "azureuser"
}
# Note: You must ensure this file exists and contains your public SSH key
variable "ssh_public_key_path" {
  default = "~/.ssh/id_rsa.pub" 
}
