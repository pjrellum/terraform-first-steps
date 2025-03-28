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

# Delegation for SQL Server
  delegation {
    name = "sqldb"
    service_delegation {
      name = "Microsoft.Sql/managedInstances"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

# STEP 3: Create Database resources
resource "azurerm_mssql_server" "workshop_db_server" {
  name                         = var.db_server_name
  resource_group_name          = azurerm_resource_group.workshop_rg.name
  location                     = azurerm_resource_group.workshop_rg.location
  version                      = "12.0"
  administrator_login          = var.db_admin_login
  administrator_login_password = var.db_admin_password
  
  tags = var.tags
}

resource "azurerm_mssql_database" "workshop_db" {
  name                = var.db_name
  server_id           = azurerm_mssql_server.workshop_db_server.id
  
  sku_name            = "Basic"
  
  tags = var.tags
}

# Allow Azure services to access the server
resource "azurerm_mssql_firewall_rule" "azure_services" {
  name                = "AllowAzureServices"
  server_id           = azurerm_mssql_server.workshop_db_server.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
