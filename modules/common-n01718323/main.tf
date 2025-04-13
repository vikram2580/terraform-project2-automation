resource "azurerm_storage_account" "storage_account_8323" {
  name                     = var.storage_account_name
  resource_group_name      = var.common_service_rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

resource "azurerm_recovery_services_vault" "vault_8323" {
  name                = var.recovery_services_vault_name
  resource_group_name = var.common_service_rg_name
  location            = var.location
  sku                 = "Standard"
  tags                = var.tags
  soft_delete_enabled = true
}

resource "azurerm_log_analytics_workspace" "analytics_8323" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.common_service_rg_name
  location            = var.location
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}
