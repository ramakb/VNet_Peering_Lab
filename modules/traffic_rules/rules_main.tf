# * * * * * * *  NSG / Security rule for LinuxVM to allow only SSH traffic from the Internet * * * * * * *
resource "azurerm_network_security_group" "nsg-LinuxVM-allowInbound-tcp" {
  name                = "nsg-LinuxVM-allowInbound-tcp"
  location            = var.location
  resource_group_name = var.rg-Exercise-5-name

  security_rule {
    name                       = "Allow_Inbound_TCP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  
  tags = {
    environment-5 = var.environment-5
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet-and-nsg-association" {
  network_security_group_id = azurerm_network_security_group.nsg-LinuxVM-allowInbound-tcp.id
  subnet_id                 = var.subnet_with_publicIP_id
}


# * * * * * * *  NSG / Security rules for Windows VM to allow only Ping [ICMP] / RDP traffic from the Linux VM as VNet Peering enabled * * * * * * *
# * * * * * * *  WindowsVM doesn't allow any Internet Traffic in to it but accepts only Private IP communication between the Peered VNets * * * * * * *
resource "azurerm_network_security_group" "nsg-WindowsVM-allowInbound-Icmp" {
  name                = "nsg-WindowsVM-allowInbound-Icmp"
  location            = var.location
  resource_group_name = var.rg-Exercise-5-name

  security_rule {
    name                       = "Allow_Inbound_ICMP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.0.0/24"
    destination_address_prefix = "10.2.1.4"
  }

  security_rule {
    name                       = "Allow_Inbound_RDP"
    priority                   = 210
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "10.1.0.0/16"
    destination_address_prefix = "*"
  }

  tags = {
    environment-5 = var.environment-5
  }
}