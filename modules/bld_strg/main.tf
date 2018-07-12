resource "azurerm_storage_account" "bldstorageaccount" {
name                = "bldstorageacc${var.uid}"
resource_group_name = "${var.resource_group_name}"
location            = "${var.location}"
account_type        = "${var.bldstorageaccountType}"
account_tier        = "Premium"
account_replication_type = "LRS"
    tags {
        environment = "non-prod"
    }
}

resource "azurerm_storage_container" "bldstoragecontainer" {
  name                  = "bldcontainer"
  resource_group_name   = "${var.resource_group_name}"
  storage_account_name  = "${azurerm_storage_account.bldstorageaccount.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "bldstorageblob" {
  name = "bldstorage.vhd"
  resource_group_name    = "${var.resource_group_name}"
  storage_account_name   = "${azurerm_storage_account.bldstorageaccount.name}"
  storage_container_name = "${azurerm_storage_container.bldstoragecontainer.name}"

  type = "page"
  size = 5120
}


