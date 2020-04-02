
# VPC resource
resource "aws_vpc" "myvpc" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "myVPC"
  }
}