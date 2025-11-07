
# Terraform 3-Tier Web App on Azure

**Important security note**
- This repository does NOT contain any Azure credentials.
- Do NOT store client secrets in Terraform files.
- Authenticate either via `az login` (recommended for local dev) or use environment variables:
  - ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID
- Or use a managed identity / service principal with secure secret storage.

## Quick start (local)
1. Install Azure CLI and Terraform.
2. Authenticate: `az login` then `az account set --subscription <SUBSCRIPTION_ID>`
3. From this directory:
   ```
   terraform init
   terraform plan
   terraform apply
   ```
4. To use a remote backend, update `backend.tf` with your storage account details.

## Contents
- provider.tf : provider config (no secrets)
- backend.tf  : example backend (fill in values)
- main.tf, variables.tf, outputs.tf : root module that calls child modules
- modules/ : network, storage, backend (VM), frontend (App Service)
