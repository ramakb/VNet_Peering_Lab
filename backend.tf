
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-statefiles"
    storage_account_name = "tfstatesacnt"
    container_name       = "tfstate-container"
    key                  = "Vnet_Peering_Lab.terraform.tfstate"
  }
}