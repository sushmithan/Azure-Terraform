resource "azurerm_network_interface" "bldnetworkInterface01" {
name                      = "${var.resource_group_name}-BLDNIC01"
location                  = "${var.location}"
resource_group_name       = "${var.resource_group_name}"
network_security_group_id = "${var.network_security_group_id}"

ip_configuration {
      name = "configuration1"
      subnet_id = "${var.subnet_id}"
      private_ip_address_allocation = "static"
      private_ip_address = "10.14.9.4"
   }
}
resource "azurerm_managed_disk" "bldmanagedisk1" {
  name                 = "BLD01DATADISK01"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1023"
}
resource "azurerm_virtual_machine" "bldvirtualmachine01" {
    name                = "${var.resource_group_name}BLD01"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    network_interface_ids = ["${var.network_interface_ids}"]
    vm_size             = "${var.bldvmSize}"

storage_image_reference {
    publisher   = "Canonical"
    offer       = "UbuntuServer"
    sku         = "18.04-LTS"
    version     = "latest"
    }
storage_os_disk {
    name              = "${var.resource_group_name}BLDOSDisk1"
    managed_disk_type = "Premium_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
}
storage_data_disk {
    name            = "${azurerm_managed_disk.bldmanagedisk1.name}"
    managed_disk_id = "${azurerm_managed_disk.bldmanagedisk1.id}"
    disk_size_gb    = "1023"
    create_option   = "Attach"
    lun = 1
    }
os_profile {
    computer_name =  "EU1PRDBLD01"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
    }
os_profile_linux_config {
disable_password_authentication = false
}
tags {
    environment = "non-prod"
    }
}
