variable "windows_rg_name" {
  type = string
}

variable "windows_avs" {
  type = string
}

variable "windows_admin_username" {
  default = "winadm"
}

variable "windows_admin_password" {
  default = "Winadm!23:"
}

variable "windows_os_disk_storage_account_type" {
  default = "StandardSSD_LRS"
}

variable "windows_os_disk_size" {
  default = 128
}

variable "windows_os_disk_caching" {
  default = "ReadWrite"
}

variable "windows_os_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_os_offer" {
  default = "WindowsServer"
}

variable "windows_os_sku" {
  default = "2016-Datacenter"
}

variable "windows_os_version" {
  default = "latest"
}

variable "windows_size" {
  type    = string
  default = "Standard_B1s"
}

variable "windows_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "nb_count" {
  type = number
}
variable "dns_prefix" {
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