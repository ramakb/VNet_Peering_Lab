# * * * * * * * * * * * *
# Project Constants
location = "Australia East"

# * * * * * * * * * * * *
# Primary Resource Group

environment-5        = "Exercise-5"
vnet1_address_space  = ["10.1.0.0/16"]
rg5-subnet-1-address = ["10.1.1.0/24"]

firewall_allocation_method = "Static" # When the sku is default 'Basic',  allocation method 'Dynamic' works but for 'Standard', it has to be a 'Static'
firewall_sku               = "Standard"

# * * * * * * * * * * * *
# Secondary Resource Group

environment-5a        = "Exercise-5a"
vnet2_address_space   = ["10.2.0.0/16"]
rg5a-subnet-1-address = ["10.2.1.0/24"]