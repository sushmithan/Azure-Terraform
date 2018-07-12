variable resource_group_name {
  description = "Resource group name"
}

variable "storageAccType"{
description = "storage account type"
default = "Standard_LRS"
}
variable "location" {}
variable resource_group_id {
  default = ""
  description = "Resource group ID"
}
variable uid {}
