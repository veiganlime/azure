terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.0.4"
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

resource "azurerm_storage_account" "lime-sa01" {
  name                     = "reslimesa01"
  resource_group_name      = azurerm_resource_group.lime.name
  location                 = azurerm_resource_group.lime.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "lime-sc-sink" {
  name                  = "rescn-sink"
  storage_account_name  = azurerm_storage_account.lime-sa01.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "lime-blob0-sink" {
  name                   = "blob-sink"
  storage_account_name   = azurerm_storage_account.lime-sa01.name
  storage_container_name = azurerm_storage_container.lime-sc-sink.name
  type                   = "Block"
  #source                 = "some-local-file.zip"
}




resource "azurerm_storage_container" "lime-sc-source" {
  name                  = "rescn-source"
  storage_account_name  = azurerm_storage_account.lime-sa01.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "lime-blob0-source" {
  name                   = "blob-source"
  storage_account_name   = azurerm_storage_account.lime-sa01.name
  storage_container_name = azurerm_storage_container.lime-sc-source.name
  type                   = "Block"
  #source                 = "some-local-file.zip"
}

resource "azurerm_databricks_workspace" "lime-db" {
  name                = "recadbw"
  resource_group_name = azurerm_resource_group.lime.name
  location            = azurerm_resource_group.lime.location
  sku                 = "standard"

  tags = {
    Environment = "DEV"
  }
}


resource "azurerm_data_factory" "lime-adf" {
  name                = "recadf"
  location            = azurerm_resource_group.lime.location
  resource_group_name = azurerm_resource_group.lime.name
}