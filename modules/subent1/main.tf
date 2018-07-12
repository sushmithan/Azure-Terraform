resource "azurerm_subnet" "subnet4" {
  name                 = "${var.resource_group_name}MGTSUBNET2"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.resource_group_name}"
  address_prefix       = "10.11.2.0/24"
}
