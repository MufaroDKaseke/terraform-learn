terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.7.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.sub_id
}

resource "azurerm_resource_group" "learn_resource_group" {
  name     = "learn_resource_group"
  location = "South Africa North"
  tags = {
    environment = "learn"
  }
}

resource "azurerm_virtual_network" "learn_vn" {
  name                = "learn_vn"
  resource_group_name = azurerm_resource_group.learn_resource_group.name
  location            = azurerm_resource_group.learn_resource_group.location
  address_space       = ["10.0.0.0/16"]
}