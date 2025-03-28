
# Provider Configuration
subscription_id      = "77163967-ced7-400c-8c49-25cd108bea77"  # Replace with actual subscription ID

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

# Database
db_server_name      = "workshopdbserver" # make sure this is unique
db_name             = "workshopdb"
db_admin_login      = "dbadmin"
db_admin_password   = "P@ssw0rd1234!"  # Change in production!
