resource "azurerm_public_ip" "rdb_publicIip" {
name = "${var.resource_group_name}RDBPUBLICIP"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"
public_ip_address_allocation = "${var.StaticIP}"
} 
