resource "aws_nat_gateway" "myNAT" {
  allocation_id = aws_eip.myEIP.id
  subnet_id     = var.pubsubnet_id
  depends_on = [var.myIGW]
  tags = {
    Name = "myNAT"
  }
}

resource "aws_eip" "myEIP" {
  vpc        = true
  depends_on = [var.myIGW]
  tags = {
    Name = "myEIP"
  }
}

