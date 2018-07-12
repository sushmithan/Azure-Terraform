resource "azurerm_public_ip" "mgtpublic_ip" {
name = "${var.resource_group_name}MGTPublicIP"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"
public_ip_address_allocation = "${var.StaticIP}"
} 

