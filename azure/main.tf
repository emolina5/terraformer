resource "random_string" "this" {
  length  = 4
  special = false
  lower   = true
  upper   = false
}

resource "azurerm_resource_group" "this" {
  name     = "rg-az104-ericm-${random_string.this.result}"
  location = "North Europe"
}

module "storage-account" {
  source = "../modules/storage-account"

  name                = "staz104ericm${random_string.this.result}"
  resource_group_name = azurerm_resource_group.this.name
  location            = "North Europe"
}

module "key-vault" {
  source = "../modules/key-vault"

  name                = "kvaz104ricm${random_string.this.result}"
  resource_group_name = azurerm_resource_group.this.name
  location            = "North Europe"
  tenant_id           = var.tenant_id
}