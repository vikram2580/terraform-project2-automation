variable "common_service_rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_name" {
  type = string
}

variable "recovery_services_vault_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Vikram.Singh"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

variable "retention_in_days" {
  type = number
}

variable "account_replication_type" {
  type = string
}

