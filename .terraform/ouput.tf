output "aws_vpc" {
    value = aws_vpc.aws_vpc.id
}
output "aws_subnet" {
    value = aws_subnet.public_subnet.id
}
output "aws_subnet" {
    value = aws_subnet.private_subnet.id
}
