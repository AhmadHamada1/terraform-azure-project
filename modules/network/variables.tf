// modules/network/variables.tf
variable "resource_group_name" {
  description = "The name of the resource group"
}

// modules/network/variables.tf
variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}


variable "location" {
  description = "The Azure region"
}

// modules/network/variables.tf
variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

variable "frontend_subnet_address" {
  description = "The address space for the frontend subnet"
  type        = list(string)
}

variable "backend_subnet_address" {
  description = "The address space for the backend subnet"
  type        = list(string)
}
