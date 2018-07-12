resource "azurerm_storage_account" "rdbstorageaccount" {
name                = "rdb${var.uid}storage"
resource_group_name = "${var.resource_group_name}"
location            = "${var.location}"
account_type        = "${var.rdbstorageAccType}"
account_tier        = "Premium"
account_replication_type = "LRS"
    tags {
        environment = "non-prod"
    }
}

resource "azurerm_storage_container" "rdbstoragecontainer" {
  name                  = "rdbcontainer"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.rdbstorageaccount.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "rdbstorageblob" {
  name = "rdb.vhd"
  resource_group_name    = "${var.resource_group_name}"
  storage_account_name   = "${azurerm_storage_account.rdbstorageaccount.name}"
  storage_container_name = "${azurerm_storage_container.rdbstoragecontainer.name}"

  type = "page"
  size = 5120
}


