output "url" {
  value = "${azurerm_storage_account.rdbstorageaccount.primary_blob_endpoint}"
}
