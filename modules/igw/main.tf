# Internet Gateway
resource "aws_internet_gateway" "myIGW" {
  vpc_id =  var.vpc_id 
  tags = {
    Name = "myIGW"
  }
}



