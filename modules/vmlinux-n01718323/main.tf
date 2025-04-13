
resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.linux_rg_name
  platform_update_domain_count = 5
  platform_fault_domain_count  = 2
  tags                         = var.tags
}

resource "azurerm_public_ip" "linux_vm" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.linux_rg_name
  domain_name_label   = "${each.key}-${var.dns_prefix}"
 allocation_method   = "Static"   # Change from Dynamic to Static
  sku                 = "Standard" # Standard is required for Static IPs
  tags                = var.tags
}

resource "azurerm_network_interface" "linux_vm" {
  for_each            = var.linux_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.linux_rg_name
  tags                = var.tags
  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_vm[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each            = var.linux_name
  name                = each.key
  resource_group_name = var.linux_rg_name
  location            = var.location
  size                = each.value
  admin_username      = var.admin_username
  availability_set_id = azurerm_availability_set.linux_avs.id

  network_interface_ids = [azurerm_network_interface.linux_vm[each.key].id]

  depends_on = [
    azurerm_network_interface.linux_vm, # Ensure NIC is ready
    azurerm_public_ip.linux_vm          # Ensure Public IP exists
  ]


  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size
  }
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  boot_diagnostics {
    storage_account_uri = "https://${var.storage_account_name}.blob.core.windows.net/"
  }

}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each           = var.linux_name
  name               = "NetworkWatcherExtension-${each.key}"
  virtual_machine_id = azurerm_linux_virtual_machine.linux_vm[each.key].id

  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each                   = var.linux_name
  name                       = "AzureMonitorExtension-${each.key}"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.14"
  auto_upgrade_minor_version = true
}
