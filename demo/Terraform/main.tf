terraform {
    backend "azurerm" {
        resource_group_name  = "rg-iac-dev-weu-00153a041a3"
        storage_account_name = "saiacdevweu"
        container_name       = "terraform"
        key                  = "demo.tfstate"
    }
}

provider "azurerm" {
    features {}
}

resource "random_id" "storage_account" {
    byte_length = 8
}

resource "azurerm_resource_group" "example" {
    name     = "rg-terraform"
    location = "West Europe"
    tags     = { workload = "iacdemo" }
}

resource "azurerm_storage_account" "example" {
    name                      = "sa${lower(random_id.storage_account.hex)}"
    resource_group_name       = azurerm_resource_group.example.name
    location                  = azurerm_resource_group.example.location
    account_tier              = "Standard"
    account_replication_type  = "LRS"
    enable_https_traffic_only = true
}
