variable "location" {
  type        = string
  description = "The Azure location to deploy resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "vm_size" {
  type        = string
  description = "The size of the virtual machine."
}

variable "admin_username" {
  type        = string
  description = "The administrator username for the VM."
}

variable "admin_password" {
  type        = string
  description = "The administrator password for the VM."
}

// modules/compute/variables.tf
variable "frontend_subnet_id" {
  description = "The ID of the frontend subnet"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}