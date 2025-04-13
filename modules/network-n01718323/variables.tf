variable "network_resource_group_8323" {
  type = string
}

variable "location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_space" {
  type    = list(string)
  default = ["10.0.1.0/16"]

}

variable "subnet_name" {
  type = string
}

variable "subnet_space" {
  type    = list(string)
  default = ["10.0.1.0/24"]

}


variable "nsg_name" {
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

