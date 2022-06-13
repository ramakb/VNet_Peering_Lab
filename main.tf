
resource "time_sleep" "wait_10_seconds" {
  create_duration = "10s"
}

resource "random_id" "random_ID" {
  byte_length = 4
}

# # * * * * * * *  module resource_groups is used to build Resource Groups [Primary and Secondary] * * * * * * *
module "resource_groups" {
  source         = "./modules/resource_groups"
  location       = var.location
  environment-5  = var.environment-5
  environment-5a = var.environment-5a
  random_ID      = random_id.random_ID.hex
}

# # * * * * * * *  module virtual_networks is used for creating vnets in each Resource Group * * * * * * *
module "virtual_networks" {
  source                     = "./modules/virtual_networks"
  location                   = var.location
  environment-5              = var.environment-5
  environment-5a             = var.environment-5a
  rg-Exercise-5-name         = module.resource_groups.rg-Exercise-5-name
  rg-Exercise-5a-name        = module.resource_groups.rg-Exercise-5a-name
  firewall_allocation_method = var.firewall_allocation_method
  firewall_sku               = var.firewall_sku
  rg5-subnet-1-address       = var.rg5-subnet-1-address
  rg5a-subnet-1-address      = var.rg5a-subnet-1-address
  vnet1_address_space        = var.vnet1_address_space
  vnet2_address_space        = var.vnet2_address_space
  depends_on                 = [module.resource_groups, time_sleep.wait_10_seconds]
}

# # * * * * * * *  module virtual_network_peering is used for setting up the peering between the 2 VNets of the RGs * * * * * * *
module "virtual_network_peering" {
  source              = "./modules/virtual_network_peering"
  location            = var.location
  environment-5       = var.environment-5
  environment-5a      = var.environment-5a
  rg-Exercise-5-name  = module.resource_groups.rg-Exercise-5-name
  rg-Exercise-5a-name = module.resource_groups.rg-Exercise-5a-name
  tf_vnet1_id         = module.virtual_networks.tf_vnet1_id
  tf_vnet2_id         = module.virtual_networks.tf_vnet2_id
  tf_vnet1_name       = module.virtual_networks.tf_vnet1_name
  tf_vnet2_name       = module.virtual_networks.tf_vnet2_name

  depends_on = [module.resource_groups, module.virtual_networks, time_sleep.wait_10_seconds]
}

# # * * * * * * *  module vm is used for creating Virtual Machines in each of the RGs * * * * * * *
module "vm" {
  source                               = "./modules/vm"
  random_ID                            = random_id.random_ID.hex
  location                             = var.location
  environment-5                        = var.environment-5
  environment-5a                       = var.environment-5a
  rg-Exercise-5-name                   = module.resource_groups.rg-Exercise-5-name
  rg-Exercise-5a-name                  = module.resource_groups.rg-Exercise-5a-name
  linuxVM_private_ip_nw_interface_id   = module.virtual_networks.linuxVM_private_ip_nw_interface_id
  windowsVM_private_ip_nw_interface_id = module.virtual_networks.windowsVM_private_ip_nw_interface_id
  final_windowsVM_pswd                 = module.az_key_vault.final_windowsVM_pswd
  final_linuxVM_pswd                   = module.az_key_vault.final_linuxVM_pswd
  depends_on                           = [module.virtual_networks, module.az_key_vault, time_sleep.wait_10_seconds]
}

# # * * * * * * *  module traffic_rules is used for setting up different NSGs to VMs to control the traffic flow * * * * * * *
module "traffic_rules" {
  source                   = "./modules/traffic_rules"
  location                 = var.location
  environment-5            = var.environment-5
  rg-Exercise-5-name       = module.resource_groups.rg-Exercise-5-name
  subnet_with_publicIP_id  = module.virtual_networks.subnet_with_publicIP_id
  subnet_with_windowsVM_id = module.virtual_networks.subnet_with_windowsVM_id
  depends_on               = [module.resource_groups, module.vm, module.virtual_networks, time_sleep.wait_10_seconds]
}

# # * * * * * * *  module traffic_rules is used for setting up different NSGs to VMs to control the traffic flow * * * * * * *
module "az_key_vault" {
  source             = "./modules/az_key_vault"
  location           = var.location
  environment-5      = var.environment-5
  rg-Exercise-5-name = module.resource_groups.rg-Exercise-5-name
  depends_on = [module.resource_groups, time_sleep.wait_10_seconds]
}
