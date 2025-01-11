# Terraform Azure Project

This project automates the deployment of a **multi-tier infrastructure** on Microsoft Azure using Terraform. It provisions resources such as virtual networks, virtual machines, load balancers, auto-scaling, and a SQL database.

---

## Table of Contents
1. [Project Overview](#project-overview)
2. [Key Features](#key-features)
3. [Prerequisites](#prerequisites)
4. [Getting Started](#getting-started)
5. [Modules](#modules)
6. [Variables](#variables)
7. [Outputs](#outputs)
8. [Usage](#usage)
9. [Destroying Resources](#destroying-resources)
10. [Contributing](#contributing)
11. [License](#license)

---

## Project Overview

This Terraform project is designed to deploy a scalable and secure infrastructure on Azure. It includes the following components:
- **Resource Group**: Organizes all resources.
- **Virtual Network (VNet)**: Creates a VNet with frontend and backend subnets.
- **Compute**: Deploys virtual machines (VMs) or Virtual Machine Scale Sets (VMSS) for frontend applications.
- **Load Balancer**: Distributes traffic across frontend VMs.
- **Auto-Scaling**: Automatically scales frontend VMs based on CPU usage.
- **SQL Database**: Deploys an Azure SQL Server and database for backend data storage.

---

## Key Features
- **Modular Design**: Each component (network, compute, database, etc.) is separated into reusable modules.
- **Auto-Scaling**: Frontend VMSS scales based on CPU thresholds.
- **Load Balancing**: Distributes traffic across frontend VMs for high availability.
- **Secure Authentication**: Uses SSH keys for VM authentication.
- **State Management**: Terraform state is stored in an Azure Storage Account for collaboration.

---

## Prerequisites

Before using this project, ensure you have the following:
1. **Terraform**: Install Terraform from [terraform.io](https://www.terraform.io/).
2. **Azure CLI**: Install and authenticate using `az login`.
3. **Azure Subscription**: Ensure you have an active Azure subscription.
4. **SSH Key**: Generate an SSH key pair for VM authentication.

---

## Getting Started

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/AhmadHamada1/terraform-azure-project.git
   cd terraform-azure-project
