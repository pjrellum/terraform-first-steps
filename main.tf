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

# STEP 2: Create a virtual network
resource "azurerm_virtual_network" "workshop_vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.workshop_rg.name
  location            = azurerm_resource_group.workshop_rg.location
  address_space       = var.address_space
  tags                = var.tags
}

# Create three subnets
resource "azurerm_subnet" "web_subnet" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.workshop_rg.name
  virtual_network_name = azurerm_virtual_network.workshop_vnet.name
  address_prefixes     = [var.subnet_prefixes[0]]
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.workshop_rg.name
  virtual_network_name = azurerm_virtual_network.workshop_vnet.name
  address_prefixes     = [var.subnet_prefixes[1]]
}

resource "azurerm_subnet" "data_subnet" {
  name                 = "data-subnet"
  resource_group_name  = azurerm_resource_group.workshop_rg.name
  virtual_network_name = azurerm_virtual_network.workshop_vnet.name
  address_prefixes     = [var.subnet_prefixes[2]]
 
}
