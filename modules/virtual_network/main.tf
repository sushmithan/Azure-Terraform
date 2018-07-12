resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}VNET01"
  location            = "${var.location}"
  address_space       = ["10.11.0.0/16"]
  resource_group_name = "${var.resource_group_name}"
}


