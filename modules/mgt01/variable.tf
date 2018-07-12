variable "location"{
 }
variable "resource_group_name" {
  default = ""
  description = "Resource group name"
}
variable "network_interface_ids" {
  default = ""
  description = "Virtual network interface ID"
}
variable "blob_storage_url" {
  default = ""
  description = "Blob storage URL"
}
variable "public_ip_address_id" {
    default = ""
}
variable "subnet_id" {
    default = ""
}
variable "admin_username" {
  default = "adminuser"
  description = "Administrator user name on VM"
}
variable "admin_password" {
    default = "Sysgain@1234"
}
variable "network_security_group_id"{
    default = ""
}

variable "StaticIP"{
    default = ""
}

variable "mgt01name" {
    default = "EU1NPRMGT01"
}
variable "vmSize" {
    default = "Standard_D8s_v3"
}
