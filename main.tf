terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

    required_version = ">= 1.1.0"
}

provider "azurerm" {
    
    subscription_id = "c4c1dd3f-4f33-487a-ac21-e8c5f83b1c58"
    features {

    }
    skip_provider_registration = true
}

resource "azurerm_resource_group" "lime" {
    
    name     = "lime"
    location = "West Europe"
}


module "sourceblob" {
    source = "./blob_module"
    base_name_account = "limelearndb"
    base_name_container = "sourcecontainer"
    base_resource_group_location = "West Europe"

}

module "sinkblob" {
    source = "./blob_module"
    base_name_account = "limelearndb"
    base_name_container = "sinkcontainer"
    base_resource_group_location = "West Europe"

}






# resource "azurerm_storage_account" "databricks" {
#     name                     = "limelearndb"
#     resource_group_name      = azurerm_resource_group.lime.name
#     location                 = azurerm_resource_group.lime.location
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
# }

# resource "azurerm_storage_container" "sourcecontainer" {
#     name                  = "sourcecontainer"
#     storage_account_name  = azurerm_storage_account.databricks.name
#     container_access_type = "private"
# }

# resource "azurerm_storage_blob" "sourceblob" {
#     name                   = "sourceblob"
#     storage_account_name   = azurerm_storage_account.databricks.name
#     storage_container_name = azurerm_storage_container.sourcecontainer.name
#     type                   = "Block"
#     #source                 = "some-local-file.zip"
# }

# resource "azurerm_storage_container" "sinkcontainer" {
#     name                  = "sinkcontainer"
#     storage_account_name  = azurerm_storage_account.databricks.name
#     container_access_type = "private"
# }

# resource "azurerm_storage_blob" "sinkblob" {
#     name                   = "sinkblob"
#     storage_account_name   = azurerm_storage_account.databricks.name
#     storage_container_name = azurerm_storage_container.sinkcontainer.name
#     type                   = "Block"
#     #source                 = "some-local-file.zip"
# }
