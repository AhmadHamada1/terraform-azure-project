terraform {
  backend "azurerm" {
    storage_account_name = "statefile"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
     resource_group_name    = "myResourceGroup"
  }
}

provider "azurerm" {
  features {}

  # Add your Azure Subscription ID here
  subscription_id = "2cb185c7-69e4-4ce4-855a-4df9eb63d13b"

}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "myResourceGroup"
  location = var.location
}

module "key_vault_secrets" {
  source = "./modules/key_vault"
}

# Network Module
module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name     = var.virtual_network_name 
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
  frontend_subnet_address = ["10.0.1.0/24"]
  backend_subnet_address  = ["10.0.2.0/24"]
}

# Compute Module
module "compute" {
  source              = "./modules/compute"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  frontend_subnet_id = module.network.frontend_subnet_id
  vm_size             = "Standard_B1s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

hh

# Database Module
module "database" {
  source              = "./modules/database"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sql_admin_username  = var.sql_admin_username
  sql_admin_password  = var.sql_admin_password
}

# load balancer Module
module "load_balancer" {
  source                     = "./modules/load_balancer"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  frontend_ip_name           = var.frontend_ip_name
  frontend_ip_public_ip_name = var.frontend_ip_public_ip_name
  frontend_ip_public_ip_id   = var.frontend_ip_public_ip_id
  frontend_subnet_address    = var.frontend_subnet_address
}

# auto_scaling Module
module "auto_scaling" {
  source                     = "./modules/auto_scaling"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  frontend_vmss_name         = var.frontend_vmss_name
  vmss_instance_count        = var.vmss_instance_count
  autoscale_max_instances    = var.autoscale_max_instances
  autoscale_min_instances    = var.autoscale_min_instances
  autoscale_cpu_threshold    = var.autoscale_cpu_threshold
  frontend_ip_name           = var.frontend_ip_name
  frontend_ip_public_ip_name = var.frontend_ip_public_ip_name
  frontend_ip_public_ip_id   = var.frontend_ip_public_ip_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  frontend_subnet_address = "10.0.1.0/24"
  frontend_subnet_id = module.network.frontend_subnet_id
  
}