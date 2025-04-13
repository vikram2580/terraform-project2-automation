output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.analytics_8323.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.vault_8323.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage_account_8323.name
}

output "storage_account_replication" {
  value = azurerm_storage_account.storage_account_8323.account_replication_type
}