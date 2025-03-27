# Configure the Azure provider
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

# STEP 1: Create a resource group
resource "azurerm_resource_group" "workshop_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
