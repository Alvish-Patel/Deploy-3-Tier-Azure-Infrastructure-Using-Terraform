resource "azurerm_service_plan" "app_plan" {
  name                = "frontend-plan-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "frontend-app-${var.random_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    "BACKEND_URL" = var.backend_private_ip
  }

  tags = {
    Environment = "Demo"
    Role        = "Frontend"
  }
}
