terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#test

resource "azurerm_resource_group" "learn" {
  name     = "${var.project_name}-group"
  location = "Central US"
}

resource "azurerm_storage_account" "example" {
  name                = lower("${var.project_name}${var.editor}")
  resource_group_name = azurerm_resource_group.learn.name
  location            = azurerm_resource_group.learn.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
}
