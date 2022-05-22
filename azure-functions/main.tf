 resource "azurerm_resource_group" "rg" {
  name     = var.example_resources
  location = var.North Europe
}

resource "azurerm_storage_account" "ra" {
  name                     = var.storageaccountname
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.FREE
  account_replication_type = var.GRS


resource "azurerm_app_service_plan" "rp" {
  name                = var.api-appserviceplan-pro
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_linux_function_app" "example" {
  name                = example-function-app
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.example.id

  storage_account_name       = azurerm_storage_account.ra.name
  storage_account_access_key = azurerm_storage_account.ra.primary_access_key

  site_config {
    application_stack {
      python_version = "3.9"
    }
  }
}
resource "azurerm_function_app_function" "example" {
  name            = "example-function-app-function"
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}
