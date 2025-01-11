variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VMs."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs."
  type        = string
}

variable "sql_admin_username" {
  description = "Admin username for the SQL server."
  type        = string
}

variable "sql_admin_password" {
  description = "Admin password for the SQL server."
  type        = string
}

// variables.tf
variable "resource_group_name" {
  description = "The name of the resource group"
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}


// Variables for Load Balancer
variable "frontend_ip_name" {
  description = "Name of the frontend IP for Load Balancer."
  type        = string
}

variable "frontend_ip_public_ip_name" {
  description = "Name of the public IP for frontend IP."
  type        = string
}



variable "frontend_subnet_address" {
  description = "Address range for frontend subnet."
  type        = string
}

// Variables for Auto-Scaling
variable "frontend_vmss_name" {
  description = "Name of the Virtual Machine Scale Set for frontend."
  type        = string
}

variable "vmss_instance_count" {
  description = "Number of instances for the Virtual Machine Scale Set."
  type        = number
}

variable "autoscale_max_instances" {
  description = "Maximum instances for auto-scaling."
  type        = number
}

variable "autoscale_min_instances" {
  description = "Minimum instances for auto-scaling."
  type        = number
}

variable "autoscale_cpu_threshold" {
  description = "CPU threshold for auto-scaling."
  type        = number
}

variable "frontend_ip_public_ip_id" {
  description = "ID of the public IP for frontend IP."
  type        = string
  default     = "/subscriptions/2cb185c7-69e4-4ce4-855a-4df9eb63d13b/resourceGroups/myResourceGroup/providers/Microsoft.Network/publicIPAddresses/myPublicIp"
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}