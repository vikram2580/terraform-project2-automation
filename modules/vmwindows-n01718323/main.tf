resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.windows_rg_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_public_ip" "windows_vm" {
  count               = var.nb_count
  name                = "${var.windows_name}-pip-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.windows_rg_name
  domain_name_label   = "${var.dns_prefix}-${var.windows_name}${format("%1d", count.index + 1)}"
 allocation_method   = "Static"   # Change from Dynamic to Static
  sku                 = "Standard" # Standard is required for Static IPs
  tags                = var.tags
}

resource "azurerm_network_interface" "windows_vm" {
  count               = var.nb_count
  name                = "${var.windows_name}-nic-${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.windows_rg_name
  tags                = var.tags
  ip_configuration {
    name                          = "${var.windows_name}-ipconfig-${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.windows_vm[*].id, count.index)
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = var.nb_count
  name                = "${var.windows_name}${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.windows_rg_name
  size                = var.windows_size
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  availability_set_id = azurerm_availability_set.windows_avs.id
  depends_on          = [azurerm_network_interface.windows_vm, azurerm_public_ip.windows_vm]
  network_interface_ids = [
    element(azurerm_network_interface.windows_vm[*].id, count.index),
  ]

  os_disk {
    name                 = "${var.windows_name}-os-disk-${format("%1d", count.index + 1)}"
    caching              = var.windows_os_disk_caching
    storage_account_type = var.windows_os_disk_storage_account_type
    disk_size_gb         = var.windows_os_disk_size
  }

  source_image_reference {
    publisher = var.windows_os_publisher
    offer     = var.windows_os_offer
    sku       = var.windows_os_sku
    version   = var.windows_os_version
  }

  winrm_listener {
    protocol = "Http"
  }

  tags = var.tags
}
# resource "azurerm_virtual_machine_extension" "antimalware" {
#   count                      = var.nb_count
#   name                       = "${var.windows_name}-antimalware-extension-${format("%1d", count.index + 1)}"
#   virtual_machine_id         = azurerm_windows_virtual_machine.windows_vm[count.index].id
#   publisher                  = "Microsoft.Azure.Security"
#   type                       = "IaaSAntimalware"
#   type_handler_version       = "1.3"
#   auto_upgrade_minor_version = true
# }

