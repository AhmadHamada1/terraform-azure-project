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


variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}