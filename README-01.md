# terraform first steps

## Initial Setup
1. Create a directory for the workshop
2. Authenticate with Azure
   ```bash
   az login

## Instructions
### STEP 1: Setup Project & Resource Group

Begin with an empty main.tf file and add the provider with your subscription ID:
```hcl
# Configure the Azure provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
```
Create the basic structure of variables.tf
```hcl
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
```

Create a terraform.tfvars file
```hcl
resource_group_name = "tf-workshop-rg"
location            = "westeurope"
tags                = {
  environment = "workshop"
  managed_by  = "terraform"
  created_by  = "student"
}
```

Add the resource group block to main.tf:
```hcl
# STEP 1: Create a resource group
resource "azurerm_resource_group" "workshop_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
```

Execute:
```bash
terraform init
terraform validate
terraform plan
terraform apply
```
Verify in the Azure Portal that the resource group was created

## Questions
1. How can you avoid having to input the Subscription Id with every command?
