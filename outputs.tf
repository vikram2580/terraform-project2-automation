// Resource Group
output "resource_group_8323" {
  value = module.resource_group.resource_group_name
}

// Network Output
output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.network.vnet_space
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "subnet_address_space" {
  value = module.network.subnet_space
}

output "nsg_name" {
  value = module.network.nsg_name
}

// Common Service
output "log_analytics_workspace" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault" {
  value = module.common.recovery_services_vault_name
}

output "storage_account" {
  value = module.common.storage_account_name
}

output "storage_account_replication" {
  value = module.common.storage_account_replication
}

// Linux VMs


output "linux_vm_hostnames" {
  value = module.vmlinux.linux_vm_hostnames
}

output "linux_vm_fqdn" {
  value = module.vmlinux.linux_vm_fqdn
}

output "linux_private_ip" {
  value = module.vmlinux.linux_private_ips
}

output "linux_public_ip" {
  value = module.vmlinux.linux_public_ips
}


// Windows VMs

output "windows_vm_hostnames" {
  value = module.vmwindows.windows_vm_hostnames
}

output "windows_vm_fqdn" {
  value = module.vmwindows.windows_vm_fqdn
}

output "windows_private_ips" {
  value = module.vmwindows.windows_private_ips
}

output "windows_public_ips" {
  value = module.vmwindows.windows_public_ips
}
