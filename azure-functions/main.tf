resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

resource "azurerm_storage_account" "ra" {
  name      = random_pet.ra-name.id
  location  = var.storage_account_location
}

resource "azurerm_app_service_plan" "rp" {
  name      = random_pet.rp-name.id
  location  = var.app_service_plan_location
}

resource "azurerm_linux_function_app" "rla" {
  name      = random_pet.rla-name.id
  location  = var.linux_function_app_location
}

resource "azurerm_function_app_function" "rf" {
  name      = random_pet.rf-name.id
  location  = var.function_app_function_location
}
