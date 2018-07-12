variable "location"{
 description = "where the vnet is create"
 default = "East US"
 }
 variable "vnet" {
 description = "name of vnet"
 default = "VNET01"
 }
 variable "subnet_id" {
    default = ""
}
 variable "resource_group_name" {
  description = "Resource group name"
  default = ""
}
variable "admin_username" {
  default = "adminuser"
  description = "Administrator user name on VM"
}
variable "admin_password" {
    default = "Sysgain@1234"
}
variable "network_interface_ids" {
  default = ""
  description = "Virtual network interface ID"
}
variable "public_ip_address_id" {
    default = ""
}
variable "network_security_group_id"{
  default = ""
}
variable "bldvmSize" {
  default = "Standard_F16s_v2"
}
