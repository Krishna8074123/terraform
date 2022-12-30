resource "aws_db_subnet_group" "subnet_db" {
  name       = "dbsubnetgroup"
  subnet_ids = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]
    depends_on = [
        aws_subnet.public_subnet
        ]
  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "krishna"
  password             = "krishna123"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.subnet_db.id
#   vpc_security_group_ids = [ aws_security_group.aws_sg.id ]
}