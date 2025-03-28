# Resource Group
resource_group_name = "tf-workshop-rg"
location            = "westeurope"
tags                = {
  environment = "workshop"
  managed_by  = "terraform"
  created_by  = "student"
}

# Networking
vnet_name           = "workshop-vnet"
address_space       = ["10.0.0.0/16"]
subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
