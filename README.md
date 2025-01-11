
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
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review the Plan**:
   ```bash
   terraform plan
   ```

4. **Deploy the Infrastructure**:
   ```bash
   terraform apply
   ```

---

## Modules

The project is organized into the following modules:

### Network
- Creates a virtual network (VNet) with frontend and backend subnets.

### Compute
- Deploys frontend VMs or VMSS with auto-scaling.

### Load Balancer
- Configures an Azure Load Balancer for frontend VMs.

### Database
- Deploys an Azure SQL Server and database.

### Auto-Scaling
- Configures auto-scaling for the frontend VMSS.

---

## Variables

The following variables are defined in `variables.tf`:

- `location`: The Azure region to deploy resources.
- `resource_group_name`: The name of the resource group.
- `admin_username`: Admin username for VMs.
- `admin_password`: Admin password for VMs.
- `sql_admin_username`: Admin username for SQL Server.
- `sql_admin_password`: Admin password for SQL Server.
- `virtual_network_name`: Name of the virtual network.
- `frontend_subnet_address`: Address range for the frontend subnet.
- `backend_subnet_address`: Address range for the backend subnet.
- `vm_size`: Size of the virtual machines.
- `autoscale_max_instances`: Maximum instances for auto-scaling.
- `autoscale_min_instances`: Minimum instances for auto-scaling.
- `autoscale_cpu_threshold`: CPU threshold for auto-scaling.

---

## Outputs

The following outputs are defined in `outputs.tf`:

- `vmss_name`: Name of the Virtual Machine Scale Set.
- `frontend_backend_pool_id`: ID of the load balancer backend pool.
- `frontend_subnet_id`: ID of the frontend subnet.

---

## Usage

### Customize Variables
Modify `variables.tf` or provide values during `terraform apply`.

### Deploy Specific Modules
Use the `-target` flag to deploy specific modules:
```bash
terraform apply -target module.network
```

### View Outputs
After deployment, view outputs using:
```bash
terraform output
```

---

## Destroying Resources

To destroy all resources created by this project:
```bash
terraform destroy
```

---

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!

---
