resource "aws_eip" "eip" {
tags = {
  "Name" = "eip"
}
}
resource "aws_nat_gateway" "nat" {
    subnet_id = aws_subnet.public_subnet[0].id
    allocation_id = aws_eip.eip.id
    depends_on = [
      aws_eip.eip,
      aws_subnet.public_subnet
    ]
}