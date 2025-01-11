
variable "frontend_vmss_name" {
  description = "The name of the frontend VM scale set"
  type        = string
}

variable "vmss_instance_count" {
  description = "The initial number of instances in the VM scale set"
  type        = number
}

variable "autoscale_max_instances" {
  description = "The maximum number of instances for autoscaling"
  type        = number
}

variable "autoscale_min_instances" {
  description = "The minimum number of instances for autoscaling"
  type        = number
}

variable "autoscale_cpu_threshold" {
  description = "The CPU usage threshold for scaling the VMSS"
  type        = number
  default     = 75
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region for the load balancer"
  type        = string
}



variable "frontend_ip_name" {
  description = "The name of the frontend IP configuration"
  type        = string
}

variable "frontend_ip_public_ip_name" {
  description = "The name of the public IP address associated with the frontend IP configuration"
  type        = string
}

variable "frontend_ip_public_ip_id" {
  description = "The public IP ID for the frontend configuration"
  type        = string
}

variable "frontend_subnet_address" {
  description = "The address for the frontend subnet"
  type        = string
}

variable "frontend_public_ip_id" {
  description = "ID of the public IP for frontend IP."
  type        = string
  default     = "/subscriptions/2cb185c7-69e4-4ce4-855a-4df9eb63d13b/resourceGroups/myResourceGroup/providers/Microsoft.Network/publicIPAddresses/myPublicIp"

}


variable "admin_username" {
  description = "Admin username for the VMs."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VMs."
  type        = string
}


variable "frontend_subnet_id" {
  description = "Admin password for the VMs."
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}