resource "azurerm_virtual_network" "vnet_8323" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.network_resource_group_8323
  address_space       = var.vnet_space
  tags                = var.tags
}

resource "azurerm_subnet" "subnet_8323" {
  name                 = var.subnet_name
  resource_group_name  = var.network_resource_group_8323
  virtual_network_name = azurerm_virtual_network.vnet_8323.name
  address_prefixes     = var.subnet_space

}

resource "azurerm_network_security_group" "nsg_8323" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.network_resource_group_8323
  tags                = var.tags
  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-http"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }



  security_rule {
    name                       = "allow-rdp"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-winrm"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}


resource "azurerm_subnet_network_security_group_association" "nsg-8323-subnet-association" {
  subnet_id                 = azurerm_subnet.subnet_8323.id
  network_security_group_id = azurerm_network_security_group.nsg_8323.id
}
