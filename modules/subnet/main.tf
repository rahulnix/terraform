# Private Subnet
resource "aws_subnet" "PriSub" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_subnet_pri
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "PriSub"
  }
}

# Public Subnet
resource "aws_subnet" "PubSub" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_subnet_pub
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "PubSub"
  }
}
