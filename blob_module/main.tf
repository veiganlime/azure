resource "azurerm_storage_account" "storage_account" {
    name                     = var.base_name_account
    resource_group_name      = var.resource_group_name
    location                 = var.base_resource_group_location
    account_tier             = var.storage_account_tier 
    account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "storage_container" {
    name                  = var.base_name_container
    storage_account_name  = var.base_name_account
    container_access_type = var.storage_container_container_access_type
}

resource "azurerm_storage_blob" "blob" {
    name                   = var.base_name_blob
    storage_account_name   = var.base_name_account
    storage_container_name = var.base_name_container
    type                   = var.blob_type
    #source                 = "some-local-file.zip"
}