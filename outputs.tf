output "frontend_url" {
  description = "Frontend App Service default URL"
  value       = module.frontend.app_service_default_site_hostname
}

output "backend_private_ip" {
  description = "Backend VM private IP"
  value       = module.backend.private_ip
}
