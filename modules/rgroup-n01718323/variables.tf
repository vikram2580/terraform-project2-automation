variable "resource_group_8323" {
  type = string
}


variable "location" {
  type = string

}

variable "tags" {
  type        = map(string)
  default = {
    Assignment    = "CCGC 5502 Automation Assignment"
    Name          = "Vikram.Singh"
    ExpirationDate = "2024-12-31"
    Environment   = "Learning"
  }
}