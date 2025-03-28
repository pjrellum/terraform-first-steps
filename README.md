# terraform first steps - part 02

## STEP 2: Add Virtual Network & Subnets

Add the networking variables to variables.tf
```hcl
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
```
Optional: Update terraform.tfvars with network values
```hcl
# Networking
vnet_name           = "workshop-vnet"
address_space       = ["10.0.0.0/16"]
subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
```

Add the virtual network and subnet resources to main.tf
```hcl
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

# ... app_subnet and data_subnet blocks
```
Execute:
```bash
terraform plan
terraform apply
```

Verify the Network resources in the Azure Portal
