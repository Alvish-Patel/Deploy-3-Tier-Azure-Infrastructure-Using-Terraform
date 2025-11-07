
provider "azurerm" {
  features {}
  # Authentication options (choose one):
  # 1) Azure CLI (recommended for local dev)
  #    Run: az login
  # 2) Environment variables:
  #    ARM_SUBSCRIPTION_ID, ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID
  # 3) Managed identity / Service Principal with secure secret storage
}
