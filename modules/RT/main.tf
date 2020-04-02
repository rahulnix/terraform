
resource "aws_route_table" "PriRT" {
  vpc_id = var.vpc_id
  tags = {
    Name = "PriRT"
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.PriRT.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_id
}

resource "aws_route_table_association" "private" {
  subnet_id      = var.prisubnet_id
  route_table_id = aws_route_table.PriRT.id
}

resource "aws_route_table" "PubRT" {
  vpc_id = var.vpc_id
  tags = {
    Name = "PubRT"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.PubRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public" {
  subnet_id      =  var.pubsubnet_id
  route_table_id = aws_route_table.PubRT.id
}
