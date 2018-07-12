resource "azurerm_network_security_group" "Nsg" {
name = "${var.resource_group_name}NSG"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"

    security_rule {
        name                       = "RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTP"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "2002"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
  
