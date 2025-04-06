resource "random_string" "this" {
  length  = 4
  special = false
  lower   = true
  upper   = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-104ericm"
  location = "North Europe"
}

module "storage-account" {
  source = "../modules/storage-account"

  name                = "st104ericm${random_string.this.result}"
  resource_group_name = azurerm_resource_group.this.name
  location            = "North Europe"
}