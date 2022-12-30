variable "ec2_instance"{
type = list(string)
description = "this is ec2"
}
variable "aws_vpc" {
  type = string
  default = "192.168.0.0/16"
  description = "This is the default vpc"
}
variable "public_subnet" {
  type = list(string)
  default = [ "192.168.0.0/24", "192.168.1.0/24" ]
  description = "This is the public subnet tags"
}
variable "private_subnet" {
  type = list(string)
  default = [  "192.168.2.0/24", "192.168.3.0/24" , "192.168.4.0/24" , "192.168.5.0/24" ]
  description = "This is the private subnet tags"
}
                                 