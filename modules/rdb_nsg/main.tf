resource "azurerm_network_security_group" "rdbNsg" {
name = "${var.resource_group_name}RDBNSG"
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
  
