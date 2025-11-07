# Generate random suffix for unique resource names
resource "random_id" "rand" {
  byte_length = 3
}

locals {
  random_suffix = random_id.rand.hex
}

# --- Network Module ---
module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  random_suffix       = local.random_suffix
}

# --- Storage Module ---
module "storage" {
  source               = "./modules/storage"
  resource_group_name  = module.network.resource_group_name
  location             = module.network.location
  storage_account_name = var.storage_account_name != null ? var.storage_account_name : "tfapp${local.random_suffix}"
}

# --- Backend VM Module ---
module "backend" {
  source              = "./modules/backend"
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  random_suffix       = local.random_suffix
}

# --- Frontend App Service Module ---
module "frontend" {
  source              = "./modules/frontend"
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
  backend_private_ip  = module.backend.private_ip
  random_suffix       = local.random_suffix
}
