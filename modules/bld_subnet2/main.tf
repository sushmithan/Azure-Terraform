resource "azurerm_subnet" "bldsubnet2" {
  name                 = "${var.resource_group_name}BLDSUBNET2"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.resource_group_name}"
  address_prefix       = "10.14.10.0/24"
  network_security_group_id  = "${var.network_security_group_id}"
}
