# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   VNet Peering from VNet1 to VNet2
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
resource "azurerm_virtual_network_peering" "peering-vnet1-to-vnet2" {
  name                      = "peering-vnet1-to-vnet2"
  resource_group_name       = var.rg-Exercise-5-name
  virtual_network_name      = var.tf_vnet1_name
  remote_virtual_network_id = var.tf_vnet2_id
}

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   VNet Peering from VNet2 to VNet1
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
resource "azurerm_virtual_network_peering" "peering-vnet2-to-vnet1" {
  name                      = "peering-vnet2-to-vnet1"
  resource_group_name       = var.rg-Exercise-5a-name
  virtual_network_name      = var.tf_vnet2_name
  remote_virtual_network_id = var.tf_vnet1_id
}