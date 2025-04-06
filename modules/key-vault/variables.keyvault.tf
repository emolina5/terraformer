variable "location" {
  type        = string
  default     = "North Europe"
  description = "Location of the storage account"

  validation {
    condition     = contains(["North Europe", "West Europe"], var.location)
    error_message = "Location must be either `North Europe` or `West Europe`"
  }
}
variable "name" {
  type        = string
  description = "Name of resource"

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.name))
    error_message = "Name must be alphanumeric lowercase and between 3 and 24 characters"
  }
}
variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "sku_name" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Possible values are `standard` and `premium`."

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "SKU must be either `standard` or `premium`."
  }
}
variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault."
}

variable "soft_delete_retention_days" {
  type        = number
  default     = "7"
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days."

  validation {
    condition     = var.soft_delete_retention_days >= 7 && var.soft_delete_retention_days <= 90 && floor(var.soft_delete_retention_days) == var.soft_delete_retention_days
    error_message = "This value must be between 7 and 90 (the default) days."
  }
}
variable "purge_protection_enabled" {
  type        = bool
  default     = false
  description = "Is Purge Protection enabled for this Key Vault?"
}