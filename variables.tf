# Provider Configuration
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  # No default provided as this should be explicitly set by each user
}

# Resource Group
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "tf-workshop-rg"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "westeurope"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    environment = "workshop"
    managed_by  = "terraform"
  }
}

# Networking
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "workshop-vnet"
}

variable "address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Address prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

# Database
variable "db_server_name" {
  description = "Name of the database server"
  type        = string
  default     = "workshopdbserver" # make sure this is unique
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "workshopdb"
}

variable "db_admin_login" {
  description = "Admin login for the database"
  type        = string
  default     = "dbadmin"
}

variable "db_admin_password" {
  description = "Admin password for the database"
  type        = string
  sensitive   = true
}
