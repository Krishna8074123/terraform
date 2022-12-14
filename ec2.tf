resource "aws_instance" "my_first_instance"{
  ami                    = "ami-02045ebddb047018b"
  instance_type          = "t2.micro"
  key_name               = "singporekey"
  subnet_id = aws_subnet.public_subnet[0].id
  security_groups         = [aws_security_group.aws_sg.id]
  tags = {
 Name = "ec2_instance"
  }
}
output "ec2" {
    value = aws_eip.eip
}
