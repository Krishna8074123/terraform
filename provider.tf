provider "aws" {
  region     = "us-west-2"
}
resource "aws_vpc" "aws_vpc" {
  cidr_block = var.aws_vpc
  tags       = {
    Name     = "aws_vpc"
  }
}

variable "public_AZs" {
  type = list(string)
  description = "Availablity zones for public subnets"
  default = [ "us-west-2a", "us-west-2b" ]
}
variable "private_AZs" {
  type = list(string)
  description = "Availablity zones for private subnets"
  default = [ "us-west-2a", "us-west-2b", "us-west-2a", "us-west-2b" ]
}

resource "aws_subnet" "public_subnet" {
  count      = length(var.public_subnet)
  cidr_block = var.public_subnet[count.index]
  vpc_id     = aws_vpc.aws_vpc.id
  map_public_ip_on_launch = true
  availability_zone = var.public_AZs[count.index]
  tags       = {
    Name     = "public_subnet${count.index}"
  }
  depends_on = [
    aws_vpc.aws_vpc
  ]
}
resource "aws_subnet" "private_subnet" {
  count      = length(var.private_subnet)
  cidr_block = var.private_subnet[count.index]
  vpc_id     = aws_vpc.aws_vpc.id
  availability_zone = var.private_AZs[count.index]
  
  tags       = {
    Name     = "private_subnet${count.index}"
  }
  depends_on = [
    aws_vpc.aws_vpc
  ]
}