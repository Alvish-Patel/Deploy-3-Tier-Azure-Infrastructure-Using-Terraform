locals {
  # Generate a random suffix for globally unique naming
  random_suffix = substr(md5(timestamp()), 0, 6)
}

module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage" {
  source               = "./modules/storage"
  resource_group_name  = module.network.resource_group_name
  location             = module.network.location
  storage_account_name = "tfapp${local.random_suffix}" # fixed interpolation
}

module "backend" {
  source              = "./modules/backend"
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  ssh_public_key      = var.ssh_public_key
  random_suffix       = local.random_suffix
}

module "frontend" {
  source              = "./modules/frontend"
  resource_group_name = module.network.resource_group_name
  location            = module.network.location
  backend_private_ip  = module.backend.private_ip
  random_suffix       = local.random_suffix
}
