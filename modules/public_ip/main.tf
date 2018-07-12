resource "azurerm_public_ip" "mgt_publicip1" {
name = "${var.resource_group_name}MGTPublicIP1"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"
public_ip_address_allocation = "${var.StaticIP}"
} 


