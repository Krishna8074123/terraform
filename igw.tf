resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.aws_vpc.id
  tags = {
    Name = "igw"
  }
}


 
