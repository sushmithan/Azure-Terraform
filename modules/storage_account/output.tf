output "url" {
  value = "${azurerm_storage_account.mgtstorageaccount.primary_blob_endpoint}"
}
