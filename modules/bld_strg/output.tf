output "url" {
  value = "${azurerm_storage_account.bldstorageaccount.primary_blob_endpoint}"
}
