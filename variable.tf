variable "network_address_space"  { 
     default = "10.11.0.0/16" 
}
variable "subnet_address_prefix" {
    default = "10.11.1.0/24"
}
variable "location" {
  default = "East US"
}

variable "admin_password" {
  default     = "Sysgain@1234"
}

variable "resource_group_name" {
  default     = "EU1NPR"
}

variable "admin_username" {
  default     = "adminuser"
}
variable "network_security_group_id"{
    default = ""
}
variable "mgt01name" {
     default = "EU1NPRMGT01"
}
variable "mgt02name" {
     default = "EU1NPRMGT02"
}
variable "StaticIP"{
    default = "static"
}
variable "subnet_id"{
    default = ""
}
