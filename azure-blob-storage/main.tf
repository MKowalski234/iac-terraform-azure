resource "azurerm_resource_group" "example" {
  name     = var."example-resources"
  location = var."North Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = var.examplestoracc
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.Standard
  account_replication_type = var.LRS
}

resource "azurerm_storage_container" "example" {
  name                  = var."content"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.private
}

resource "azurerm_storage_blob" "example" {
  name                   = var.my-awesome-content.zip
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = var.Block
  source                 = var.some-local-file.zip
}
