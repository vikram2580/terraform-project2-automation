terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01718323RG"
    storage_account_name = "tfstaten01718323sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate_lab06"
  }
}
