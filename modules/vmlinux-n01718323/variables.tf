variable "linux_rg_name" {
  type = string
}

variable "linux_name" {
  type = map(string)
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "n01718323"
}

variable "public_key" {
  default = "/home/n01718323/.ssh/id_rsa.pub"
}

variable "private_key" {
  default = "/home/n01718323/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  default = "Premium_LRS"
}

variable "os_disk_size" {
  default = 32
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "os_publisher" {
  default = "OpenLogic"
}

variable "os_offer" {
  type    = string
  default = "CentOS"
}

variable "os_sku" {
  default = "8_2"
}

variable "os_version" {
  default = "latest"
}


variable "linux_avs" {
  type = string

}
variable "dns_prefix" {
  type = string
}

variable "location" {
  type = string
}
variable "subnet_id" {
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

variable "storage_account_name" {
  type = string
}
