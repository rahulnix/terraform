resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      =  var.vpc_id 

  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # prefix_list_ids = ["pl-12c4e678"]
  }
  tags = {
    Name = "Allow SSH"
  }
}


resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    =  aws_security_group.allow_ssh.id 
  network_interface_id =  var.network_interface_id 
}
