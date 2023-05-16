resource "azurerm_data_factory" "adf"{
    name = var.base_name_datafactory
    location = var.resource_group_location
    resource_group_name = var.resource_group_name
}