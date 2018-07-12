resource "azurerm_network_security_group" "bld_nsg" {
name = "${var.resource_group_name}-BLDNSG"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"

    security_rule {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "2002"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}
  
