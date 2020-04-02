
resource "aws_instance" "Server" {
  ami                         = "ami-04b762b4289fba92b"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "rahulinux"
  source_dest_check           = true
  subnet_id                   = var.pubsubnet_id

  #VERY MUCH IMP STEP(To Avoid default SG)
  #security_groups = ["${var.allow_ssh_id}", ]

  tags = {
    "Name" = "Server"
  }
  root_block_device {
    volume_size = "8"
    volume_type = "standard"
  }
}

####################################################
