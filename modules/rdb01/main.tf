resource "azurerm_network_interface" "rdbnetworkInterface1" {
name                      = "${var.resource_group_name}RDB-NIC01"
location                  = "${var.location}"
resource_group_name       = "${var.resource_group_name}"
network_security_group_id = "${var.network_security_group_id}"

ip_configuration {
      name = "configuration1"
      subnet_id = "${var.subnet_id}"
      private_ip_address_allocation = "static"
      private_ip_address = "10.11.17.4"
   }
}
resource "azurerm_managed_disk" "managedisk" {
  name                 = "RDBDATADISK01"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group_name}"
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1023"
}
resource "azurerm_virtual_machine" "rdbvirtualmachine" {
name = "${var.resource_group_name}RDB01"
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
name = "${var.resource_group_name}RDBOSDisk1"
managed_disk_type = "Premium_LRS"
caching = "ReadWrite"
create_option = "FromImage"
}
storage_data_disk {
  name = "${azurerm_managed_disk.managedisk.name}"
  managed_disk_id = "${azurerm_managed_disk.managedisk.id}"
#name = "${var.resource_group_name}DATADISK1"
#managed_disk_type = "Standard_LRS"
#vhd_uri = "${azurerm_storage_account.rdbstorageAccount.primary_blob_endpoint}${azurerm_storage_container.rdbstorageContainer.name}/datadisk0.vhd"
#managed_disk_id = "${azurerm_managed_disk.managedisk.id}"
#managed_disk_type = "Premium_LRS"
disk_size_gb = "1023"
create_option = "Attach"
lun = 1
}
os_profile {
computer_name =  "EU1NPRRDB01"
admin_username = "${var.admin_username}"
admin_password = "${var.admin_password}"
}
os_profile_linux_config {
disable_password_authentication = false
}
#boot_diagnostics {
#    enabled = "true"
#    storage_uri = "${var.blob_storage_url}"
#  }
tags {
environment = "non-prod"
}
}
