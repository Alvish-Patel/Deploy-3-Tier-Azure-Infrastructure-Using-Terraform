# 🚀 Terraform 3-Tier Azure Infrastructure Project

## 📘 Overview
This project automates the provisioning of a **3-Tier Web Application Architecture** on **Microsoft Azure** using **Terraform**.  
It includes separate layers for **Network**, **Storage**, **Backend (VM)**, and **Frontend (App Service)** — all modular and reusable.

## 🏗️ Architecture
### 🔹 Components Deployed
1. Resource Group
2. Virtual Network & Subnet (Network Layer)
3. Storage Account & Container (Storage Layer)
4. Backend VM (Linux) with SSH Access
5. App Service Plan (Hosting Tier)
6. Frontend Web App (Node.js Web App)
7. Outputs — Frontend URL & Backend Private IP

## 🧩 Project Structure
```
terraform-3tier-app/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── network/
│   ├── backend/
│   ├── storage/
│   ├── frontend/
└── terraform.tfstate
```

## ⚙️ Prerequisites
- Terraform v1.5+
- Azure CLI (optional if using service principal)
- Active Azure Subscription
- SSH key pair generated:
  ```bash
  ssh-keygen -t rsa -b 4096
  ```

## 🔑 Azure Authentication
### Option 1: Using Azure CLI
```bash
az login
```

### Option 2: Using Service Principal
```hcl
provider "azurerm" {
  subscription_id = "<YOUR_SUBSCRIPTION_ID>"
  client_id       = "<YOUR_CLIENT_ID>"
  client_secret   = "<YOUR_CLIENT_SECRET>"
  tenant_id       = "<YOUR_TENANT_ID>"
  features {}
}
```

## 🚀 Deployment Steps
```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform output
```

## 🌐 Outputs
| Output Name         | Description |
|----------------------|-------------|
| frontend_url         | Public URL of the web app |
| backend_private_ip   | Internal IP of backend VM |

## 🧠 Post Deployment
### 🔸 Frontend Deployment
```bash
az webapp deploy --resource-group tfapp-rg --name frontend-app-XXXXXX --src-path ./build
```

### 🔸 Backend Deployment
```bash
ssh azureuser@<public_ip_of_vm>
git clone <your-backend-repo>
cd backend
npm install
npm start
```

## 🧹 Cleanup
```bash
terraform destroy
```

## 📄 Project Summary
- Purpose: Deploy a modular 3-tier Azure app using Terraform  
- Tools: Terraform, Azure Resource Manager  
- Outcome: Automated provisioning (Network, Storage, Compute, App Service)  
- Next: Deploy application code to frontend & backend

## 👨‍💻 Author
**Aelvish Patel**  
Hashtech Innovations  
*Infrastructure as Code • DevOps • Cloud Automation*
