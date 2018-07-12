resource "azurerm_subnet" "subnet" {
  name                 = "${var.resource_group_name}SUBNET"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.resource_group_name}"
  address_prefix       = "10.11.1.0/24"
}
