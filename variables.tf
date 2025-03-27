# Provider Configuration
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
  # No default provided as this should be explicitly set per environment
}

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
