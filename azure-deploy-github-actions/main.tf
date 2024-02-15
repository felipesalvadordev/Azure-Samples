terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
backend "azurerm" {
    resource_group_name     = "rg_storage_tf"
    storage_account_name    = "tfstoragesalvador"
    container_name          = "tfstate"
    key                     = "tfstate"
  }
}
provider "azurerm" {
  features {}
}
#Create Resource Group
resource "azurerm_resource_group" "another_rg" {
  name     = "another_rg"
  location = "westeurope"
}

#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "salvador-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.another_rg.name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.another_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["192.168.0.0/24"]
}