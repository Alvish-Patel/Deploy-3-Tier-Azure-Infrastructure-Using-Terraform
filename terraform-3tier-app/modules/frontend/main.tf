resource "azurerm_service_plan" "app_plan" {
  name                = "frontend-plan-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"

  sku_name = "F1"
}


resource "azurerm_app_service" "frontend" {
  name                = "frontend-app-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id

  app_settings = {
    "BACKEND_URL" = var.backend_private_ip
  }
}
