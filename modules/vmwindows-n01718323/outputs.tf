output "windows_vm_hostnames" {
  value = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "windows_vm_fqdn" {
  value = azurerm_public_ip.windows_vm[*].fqdn
}

output "windows_private_ips" {
  value = azurerm_network_interface.windows_vm[*].ip_configuration[0].private_ip_address
}

output "windows_public_ips" {
  value = azurerm_public_ip.windows_vm[*].ip_address
}