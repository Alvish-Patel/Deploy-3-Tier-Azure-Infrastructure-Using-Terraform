variable "location" {
  description = "Azure region to deploy resources in"
  type        = string
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "tfapp-rg"
}

variable "admin_username" {
  description = "Admin username for backend VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "Path to SSH public key file for VM"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Do NOT put dynamic resource references here. Use null to allow auto-generation.
variable "storage_account_name" {
  description = "Storage account name (auto-generated if not provided)"
  type        = string
  default     = null
}
