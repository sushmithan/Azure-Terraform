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
variable "blob_storage_url" {
  default = ""
  description = "Blob storage URL"
}
variable "public_ip_address_id" {
    default = ""
}
variable "network_security_group_id"{
  default = ""
}
variable "rdbvmSize" {
  default = "Standard_F64s_v2"
}
