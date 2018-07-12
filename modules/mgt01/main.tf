resource "azurerm_network_interface" "mgt_networkInterface1" {
name                      = "${var.resource_group_name}-NIC"
location                  = "${var.location}"
resource_group_name       = "${var.resource_group_name}"
network_security_group_id = "${var.network_security_group_id}"
ip_configuration {
name                      = "configuration1"
subnet_id                 = "${var.subnet_id}"
private_ip_address_allocation = "static"
private_ip_address         = "10.11.1.4"
public_ip_address_id       = "${var.public_ip_address_id}"
    }
}

resource "azurerm_virtual_machine" "virtualmachine" {
name                = "${var.resource_group_name}MGT01"
location            = "${var.location}"
resource_group_name = "${var.resource_group_name}"
network_interface_ids = ["${var.network_interface_ids}"]
vm_size             = "${var.vmSize}"

storage_image_reference { 
    publisher        = "MicrosoftWindowsServer"
    offer            = "WindowsServer"
    sku              = "2016-Datacenter"
    version          = "latest"
   }
storage_os_disk {
    name            = "${var.resource_group_name}OSDisk"
    caching         = "ReadWrite"
    create_option   = "FromImage"
    managed_disk_type = "Standard_LRS"
   }

os_profile {
    computer_name = "${var.mgt01name}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }
os_profile_windows_config {
    enable_automatic_upgrades = false
  }
boot_diagnostics {
    enabled = "true"
    storage_uri = "${var.blob_storage_url}"
  }
tags {
    environment = "non-prod" 
  }
}

