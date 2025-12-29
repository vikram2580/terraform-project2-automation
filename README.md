
---

# 📄 README.md — PROJECT 2  
**(terraform-project2-automation)**

```md
# Azure Infrastructure Automation with Terraform – Project 2

This project focuses on **advanced Terraform automation** using modular design, remote state management, and production-style Azure infrastructure provisioning.

## 🚀 Architecture Overview

The infrastructure includes:
- Azure Resource Group
- Virtual Network and Subnet
- Network Security Groups
- Linux and Windows Virtual Machines
- Availability Sets
- Azure Storage Account
- Log Analytics Workspace
- Recovery Services Vault
- Azure Monitor and Network Watcher
- Remote Terraform State (Azure Storage Backend)

## 🛠 Technologies Used
- Terraform
- Microsoft Azure
- Azure Virtual Machines (Linux & Windows)
- Azure Networking
- Azure Monitor & Log Analytics
- Azure Storage (Remote Backend)

## 📁 Project Structure
├── modules/
│ ├── rgroup-n01718323
│ ├── network-n01718323
│ ├── common-n01718323
│ ├── vmlinux-n01718323
│ └── vmwindows-n01718323
├── main.tf
├── backend.tf
├── variables.tf
├── outputs.tf


## ⚙️ Key Features
- Remote Terraform state stored in Azure Storage
- Modular and reusable Terraform components
- High availability using Availability Sets
- Static public IPs (Standard SKU)
- Monitoring and diagnostics enabled
- Secure and scalable cloud architecture

## ▶️ How to Deploy
```bash
terraform init
terraform validate
terraform plan
terraform apply
