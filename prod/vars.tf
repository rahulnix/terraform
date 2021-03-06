variable "access_key" {
  default = "xxxxxxxxxxxxxxxxx"
 }
variable "secret_key" {
  default = "xxxxxxxxxxx"
}
variable "aws_region" {
  default = "us-west-2"
  #Oregon
}
#-------------------------

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}
variable "cidr_subnet_pri" {
  default = "10.0.1.0/24"
}
variable "cidr_subnet_pub" {
  default = "10.0.2.0/24"
}
#--------------------------

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}