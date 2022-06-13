# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   Primary Resource Group
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

resource "azurerm_resource_group" "rg-Exercise-5" {
  location = var.location
#  name     = "rg-${var.environment-5}-${random_id.random_ID.hex}"
  name     = "rg-${var.environment-5}-${var.random_ID}"
  
  tags = {
    environment-5 = var.environment-5
    name          = "Primary Resource Group"
  }
}

data "azurerm_resource_group" "rg-Exercise-5" {
  name = azurerm_resource_group.rg-Exercise-5.name
}

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   Secondary Resource Group
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

resource "azurerm_resource_group" "rg-Exercise-5a" {
  location = var.location
  name     = "rg-${var.environment-5a}"
  tags = {
    environment-5a = var.environment-5a
    name           = "Secondary Resource Group"
  }
}

data "azurerm_resource_group" "rg-Exercise-5a" {
  name = azurerm_resource_group.rg-Exercise-5a.name
}