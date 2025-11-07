output "app_service_default_site_hostname" {
  description = "Default hostname of the frontend web app"
  value       = azurerm_linux_web_app.frontend.default_hostname
}
