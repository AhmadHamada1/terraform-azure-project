variable "location" {
  type        = string
  description = "The Azure location to deploy resources."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "sql_admin_username" {
  type        = string
  description = "The administrator username for the SQL database."
}

variable "sql_admin_password" {
  type        = string
  description = "The administrator password for the SQL database."
}
