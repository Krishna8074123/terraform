resource "aws_security_group" "aws_sg" {
  name        = "security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.aws_vpc.id
  ingress {
    description      = "mysql_port"
    from_port        = 3306 
     to_port         = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.aws_vpc.cidr_block]
  }
  ingress {
    description      = "port"
    from_port        = 80
     to_port         = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.aws_vpc.cidr_block]
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }
  tags = {
    Name = "sgroup"
  }
}
