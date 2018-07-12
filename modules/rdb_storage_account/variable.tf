variable resource_group_name {
  description = "Resource group name"
}

variable "rdbstorageAccType"{
description = "storage account type"
default = "Premium_LRS"
}
variable "location" {}
variable resource_group_id {
  default = ""
  description = "Resource group ID"
}
variable uid {}
