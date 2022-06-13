
output "tf_vnet1_id" {
  value = azurerm_virtual_network.tf-vnetwork-01.id
}
output "tf_vnet1_name" {
  value = azurerm_virtual_network.tf-vnetwork-01.name
}

output "tf_vnet2_id" {
  value = azurerm_virtual_network.tf-vnetwork-02.id
}
output "tf_vnet2_name" {
  value = azurerm_virtual_network.tf-vnetwork-02.name
}

output "subnet_with_publicIP_id" {
  value = azurerm_subnet.rg5-subnet-1.id
}

output "subnet_with_windowsVM_id" {
  value = azurerm_subnet.rg5a-subnet-1.id
}

output "linuxVM_private_ip_nw_interface_id" {
  value = azurerm_network_interface.linuxVM_private_ip_nw_interface.id
}

output "windowsVM_private_ip_nw_interface_id" {
  value = azurerm_network_interface.windowsVM_private_ip_nw_interface.id
}