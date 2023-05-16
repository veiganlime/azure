output "storage_account_name_out" {
  value       = resource.azurerm_storage_account.storage_account.name
  description = "description"
}
output "storage_container_name_out" {
  value       = resource.azurerm_storage_container.storage_container.name
  description = "description"
}
output "storage_blob_name_out" {
  value       = resource.azurerm_storage_blob.blob.name
  description = "description"
}

