resource "aws_instance" "my_first_instance"{
  count = 2
  ami                    = "ami-017fecd1353bcc96e"
  instance_type          = "t2.micro"
  key_name               = "my_keypair"
  subnet_id = aws_subnet.public_subnet[count.index].id
  security_groups         = [aws_security_group.aws_sg.id]
  tags = {
 Name = "ec2_instance"
  }
}
output "ec2" {
    value = aws_eip.eip
}