output "private_ip" {
  description = "Private IP address of the backend VM"
  value       = azurerm_network_interface.nic.private_ip_address
}
