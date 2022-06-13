
variable "location" {}

variable "rg-Exercise-5-name" {}

variable "rg-Exercise-5a-name" {}

variable "environment-5" {}

variable "environment-5a" {}

variable "vnet1_address_space" {}

variable "vnet2_address_space" {}

variable "rg5-subnet-1-address" {}

variable "rg5a-subnet-1-address" {}

variable "firewall_allocation_method" {}

variable "firewall_sku" {}

variable "linux-public-ip" {
  default = ""
  type = string
}