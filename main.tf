module "resource_group" {
  source              = "./modules/rgroup-n01718323"
  resource_group_8323 = "n01718323-RG"
  location            = "UK West"
}

module "network" {
  source                      = "./modules/network-n01718323"
  vnet_name                   = "n01718323-VNET"
  network_resource_group_8323 = module.resource_group.resource_group_name
  location                    = "UK West"
  vnet_space                  = ["10.0.0.0/16"]
  subnet_name                 = "n01718323-SUBNET"
  subnet_space                = ["10.0.1.0/24"]
  nsg_name                    = "n01718323-NSG"
  depends_on                  = [module.resource_group]
}

module "common" {
  source                       = "./modules/common-n01718323"
  common_service_rg_name       = module.resource_group.resource_group_name
  location                     = " UK West"
  storage_account_name         = "n01718323storage"
  log_analytics_workspace_name = "n01718323-analytics"
  recovery_services_vault_name = "n01718323-vault"
  account_replication_type     = "LRS"
  retention_in_days            = 30
  depends_on                   = [module.resource_group]

}

module "vmlinux" {
  source               = "./modules/vmlinux-n01718323"
  linux_rg_name        = module.resource_group.resource_group_name
  location             = "UK West"
  storage_account_name = module.common.storage_account_name
  linux_name           = { n01718323-linux-vm1 = "Standard_B1s", n01718323-linux-vm2 = "Standard_B1s"}
  linux_avs            = "n01718323-l-vm"
  dns_prefix           = "n01718323"
  subnet_id            = module.network.subnet_id
  depends_on           = [module.resource_group]
}

module "vmwindows" {
  source          = "./modules/vmwindows-n01718323"
  windows_rg_name = module.resource_group.resource_group_name
  windows_name    = "n01718323-w-vm"
  windows_avs     = "assignmnet1-w-vm-8323"
  windows_size    = "Standard_B1s"
  location        = "UK West"
  subnet_id       = module.network.subnet_id
  dns_prefix      = "n01718323"
  depends_on      = [module.resource_group]
  nb_count        = 1
}
