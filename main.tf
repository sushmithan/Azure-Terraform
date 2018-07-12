module "resource_group" {
  source              = "modules/resource_group"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
}
module "unique_id" {
  source              = "modules/unique_id"
  resource_group_name = "${module.resource_group.name}"
}
module "virtual_network" {
  source              = "modules/virtual_network"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "virtual_network2" {
    source              = "modules/virtual_network2"
    location            = "${var.location}"
    resource_group_name = "${module.resource_group.name}"
}
module "storage_account" {
  source              = "modules/storage_account"
  location            = "${var.location}"
  resource_group_id   = "${module.resource_group.id}"
  resource_group_name = "${module.resource_group.name}"
  uid = "${module.unique_id.uid}"
}

module "mgt01" {
  source                = "modules/mgt01"
  location              = "${var.location}"
  network_interface_ids = "${module.mgt01.id}"
  resource_group_name   = "${module.resource_group.name}"
  blob_storage_url      = "${module.storage_account.url}"
  admin_password        = "${var.admin_password}"
  admin_username        = "${var.admin_username}"
  public_ip_address_id = "${module.public_ip.id}"
  subnet_id = "${module.subnet.id}"
  mgt01name = "${var.mgt01name}"
  network_security_group_id = "${module.network_security.id}"
}

module "subnet" {
  source = "modules/subnet"
  resource_group_name = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
}

module "public_ip" {
  source = "modules/public_ip"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "network_security" {
  source = "modules/network_security"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "rdb_nsg" {
  source = "modules/rdb_nsg"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "bld_nsg" {
  source              = "modules/bld_nsg"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "rdb_publicIp" {
  source = "modules/rdb_publicIp"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "bld_pip" {
  source              = "modules/bld_pip"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "rdb_subnet" {
  source = "modules/rdb_subnet"
  resource_group_name = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
}

module "rdb_subnet2" {
  source = "modules/rdb_subnet2"
  resource_group_name = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
}

module "rdb_subnet3" {
  source = "modules/rdb_subnet3"
  resource_group_name = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
}
module "subnet1" {
  source = "modules/subnet1"
  resource_group_name = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network.name}"
}
module "bld_subnet1" {
  source               = "modules/bld_subnet1"
  resource_group_name  = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network2.name}"
}
module "bld_subnet2" {
  source               = "modules/bld_subnet2"
  resource_group_name  = "${module.resource_group.name}"
  virtual_network_name = "${module.virtual_network2.name}"
}
module "bld_strg" {
  source              = "modules/bld_strg"
  location            = "${var.location}"
  resource_group_id   = "${module.resource_group.id}"
  resource_group_name = "${module.resource_group.name}"
  uid                 = "${module.unique_id.uid}"
}
module "rdb_storage_account" {  
  source = "modules/rdb_storage_account"
  location = "${var.location}"
  resource_group_id = "${module.resource_group.id}"
  resource_group_name = "${module.resource_group.name}"
  uid = "${module.unique_id.uid}"
}

module "rdb01" {
  source = "modules/rdb01"
  location = "${var.location}"
  network_interface_ids = "${module.rdb01.id}"
  resource_group_name = "${module.resource_group.name}"
  blob_storage_url = "${module.rdb_storage_account.url}"
  admin_password    = "${var.admin_password}"
  admin_username = "${var.admin_username}"
  network_security_group_id = "${var.rdb_nsg.id}"
  public_ip_address_id = "${module.rdb_publicIp.id}"
  subnet_id = "${module.rdb_subnet.id}"
  network_security_group_id = "${module.rdb_nsg.id}"
}

module "rdb02" {
  source = "modules/rdb02"
  location = "${var.location}"
  network_interface_ids = "${module.rdb02.id}"
  resource_group_name = "${module.resource_group.name}"
  #blob_storage_url = "${module.rdb_storage_account.url}"
  admin_password    = "${var.admin_password}"
  admin_username = "${var.admin_username}"
  network_security_group_id = "${var.rdb_nsg.id}"
  public_ip_address_id = "${module.rdb_publicIp.id}"
  subnet_id = "${module.rdb_subnet2.id}"
  network_security_group_id = "${module.rdb_nsg.id}"
}

module "rdb03" {
  source = "modules/rdb03"
  location = "${var.location}"
  network_interface_ids = "${module.rdb03.id}"
  resource_group_name = "${module.resource_group.name}"
  #blob_storage_url = "${module.rdb_storage_account.url}"
  admin_password    = "${var.admin_password}"
  admin_username = "${var.admin_username}"
  network_security_group_id = "${var.rdb_nsg.id}"
  public_ip_address_id = "${module.rdb_publicIp.id}"
  subnet_id = "${module.rdb_subnet3.id}"
  network_security_group_id = "${module.rdb_nsg.id}"
}

module "mgt_publicIp" {
  source = "modules/mgt_publicIp"
  location = "${var.location}"
  resource_group_name = "${module.resource_group.name}"
}
module "mgt02" {
  source = "modules/mgt02"
  location = "${var.location}"
  network_interface_ids = "${module.mgt02.id}"
  resource_group_name = "${module.resource_group.name}"
  blob_storage_url = "${module.storage_account.url}"
  admin_password    = "${var.admin_password}"
  admin_username = "${var.admin_username}"
  public_ip_address_id = "${module.mgt_publicIp.id}"
  subnet_id = "${module.subnet1.id}"
  mgt02name = "${var.mgt02name}"
  network_security_group_id = "${module.network_security.id}"
}
module "bld01" {
  source                 = "modules/bld01"
  location               = "${var.location}"
  network_interface_ids  = "${module.bld01.id}"
  resource_group_name    = "${module.resource_group.name}"
  #blob_storage_url       = "${module.bld_storage.url}"
  admin_password         = "${var.admin_password}"
  admin_username         = "${var.admin_username}"
  public_ip_address_id   = "${module.bld_pip.id}"
  subnet_id              = "${module.bld_subnet1.id}"
  network_security_group_id = "${module.bld_nsg.id}"
}
module "bld02" {
  source                 = "modules/bld02"
  location = "${var.location}"
  network_interface_ids = "${module.bld02.id}"
  resource_group_name = "${module.resource_group.name}"
  #blob_storage_url = "${module.bld_storage.url}"
  admin_password    = "${var.admin_password}"
  admin_username = "${var.admin_username}"
  public_ip_address_id = "${module.bld_pip.id}"
  subnet_id = "${module.bld_subnet2.id}"
  network_security_group_id = "${module.bld_nsg.id}"
}
   


