output "linux_vm_hostnames" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].name
}

output "linux_vm_fqdn" {
  value = values(azurerm_public_ip.linux_vm)[*].fqdn
}

output "linux_private_ips" {
  value = values(azurerm_network_interface.linux_vm)[*].private_ip_address
}

output "linux_public_ips" {
  value = values(azurerm_public_ip.linux_vm)[*].ip_address
}
