provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}
#------------------------------------
module "myvpc" {
  source = "../modules/vpc"
}
#------------------------------------
module "subnet" {
  source = "../modules/subnet"
  vpc_id = module.myvpc.vpc_id
}
#------------------------------------
module "igw" {
  source = "../modules/igw"
  vpc_id = module.myvpc.vpc_id
}
#------------------------------------
module "nat" {
  source       = "../modules/NAT"
  vpc_id       = module.myvpc.vpc_id
  pubsubnet_id = module.subnet.pubsubnet_id
  myIGW        = module.igw.igw_id
}
#------------------------------------
module "instances" {
  source       = "../modules/instances"
  pubsubnet_id = module.subnet.pubsubnet_id
  allow_ssh_id = module.sg.allow_ssh_id
}
#------------------------------------
module "rt" {
  source       = "../modules/RT"
  vpc_id       = module.myvpc.vpc_id
  prisubnet_id = module.subnet.prisubnet_id
  pubsubnet_id = module.subnet.pubsubnet_id
  igw_id       = module.igw.igw_id
  nat_id       = module.nat.nat_id
  PriRT_id     = module.rt.PriRT_id
}
#------------------------------------
module "sg" {
  source               = "../modules/SG"
  vpc_id               = module.myvpc.vpc_id
  network_interface_id = module.instances.network_interface_id
}
#------------------------------------
module "db" {
  source = "../modules/db"
}
#------------------------------------
module "dns" {
  source       = "../modules/dns"
  vpc_id       = module.myvpc.vpc_id
  public_ip_id = module.instances.public_ip_id
}
#------------------------------------
