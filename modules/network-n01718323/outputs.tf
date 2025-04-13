output "network_resource_group" {
  value = azurerm_virtual_network.vnet_8323.resource_group_name
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet_8323.name
}

output "vnet_space" {
  value = azurerm_virtual_network.vnet_8323.address_space
}
output "subnet_name" {
  value = azurerm_subnet.subnet_8323.name
}
output "subnet_space" {
  value = azurerm_subnet.subnet_8323.address_prefixes
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg_8323.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet_8323.id
}
