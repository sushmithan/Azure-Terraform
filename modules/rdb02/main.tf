resource "azurerm_network_interface" "rdbnetworkInterface2" {
name                      = "${var.resource_group_name}RDB-NIC02"
location                  = "${var.location}"
resource_group_name       = "${var.resource_group_name}"
network_security_group_id = "${var.network_security_group_id}"

ip_configuration {
      name = "configuration1"
      subnet_id = "${var.subnet_id}"
      private_ip_address_allocation = "static"
      private_ip_address = "10.11.18.4"
   }
}
resource "azurerm_managed_disk" "managedisk1" {
  name                 = "RDBDATADISK02"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1023"
}
resource "azurerm_virtual_machine" "rdbvirtualmachine1" {
name = "${var.resource_group_name}RDB02"
location = "${var.location}"
resource_group_name = "${var.resource_group_name}"
network_interface_ids = ["${var.network_interface_ids}"]
vm_size = "${var.rdbvmSize}"

storage_image_reference {
publisher = "Canonical"
offer = "UbuntuServer"
sku = "16.04-LTS"
version = "latest"
}
storage_os_disk {
name = "${var.resource_group_name}RDBOSDisk2"
managed_disk_type = "Standard_LRS"
caching = "ReadWrite"
create_option = "FromImage"
}
storage_data_disk {
  name = "${azurerm_managed_disk.managedisk1.name}"
  managed_disk_id = "${azurerm_managed_disk.managedisk1.id}"
disk_size_gb = "1023"
create_option = "Attach"
lun = 1
}
os_profile {
computer_name =  "EU1NPRRDB02"
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
