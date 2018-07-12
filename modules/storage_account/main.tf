resource "azurerm_storage_account" "mgtstorageaccount" {
name                = "mgt${var.uid}storage"
resource_group_name = "${var.resource_group_name}"
location            = "${var.location}"
account_type        = "${var.storageAccType}"
account_tier        = "Standard"
account_replication_type = "LRS"
    tags {
        environment = "non-prod"
    }
}

resource "azurerm_storage_container" "mgtstoragecontainer" {
  name                  = "vhds"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.mgtstorageaccount.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "mgtstorageblob" {
  name = "mgt.vhd"

  resource_group_name    = "${var.resource_group_name}"
  storage_account_name   = "${azurerm_storage_account.mgtstorageaccount.name}"
  storage_container_name = "${azurerm_storage_container.mgtstoragecontainer.name}"

  type = "page"
  size = 5120
}


