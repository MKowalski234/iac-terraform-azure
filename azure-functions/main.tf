resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "ra" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.ra.name
  location                 = azurerm_resource_group.ra.location
  account_tier             = "Standard"
  account_replication_type = "GRS"


resource "azurerm_app_service_plan" "rp" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.rp.location
  resource_group_name = azurerm_resource_group.rp.name

}

resource "azurerm_linux_function_app" "example" {
  name                = "example-linux-function-app"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name = azurerm_storage_account.example.name
  service_plan_id      = azurerm_service_plan.example.id
resource "azurerm_linux_function_app" "example" {
  name                = "example-function-app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  service_plan_id     = azurerm_service_plan.example.id

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }
}
  
