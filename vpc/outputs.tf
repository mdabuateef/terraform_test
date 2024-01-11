output "vpc"{
value = aws_vpc.main
description = "vpc info"
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1
  description = "public subnet 1 info"
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_2
  description = "public subnet 2 info"
}