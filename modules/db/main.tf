
resource "aws_db_instance" "default" {
  allocated_storage    = 8
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = "true"
}
