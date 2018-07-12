resource "azurerm_virtual_network" "virtual_network2" {
  name                = "${var.resource_group_name}VNET02"
  location            = "${var.location}"
  address_space       = ["10.14.0.0/16"]
  resource_group_name = "${var.resource_group_name}"
}
