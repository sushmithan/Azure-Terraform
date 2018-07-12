resource "azurerm_public_ip" "bld_pip" {
name = "${var.resource_group_name}-BLDPUBLICIP"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"
public_ip_address_allocation = "${var.StaticIP}"
} 
