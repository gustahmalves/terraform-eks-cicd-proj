output "vpc_id" {
  value = aws_vpc.my_vpc.id

}

output "subnet_1a" {
  value = aws_subnet.vpc_subnet.id
}

output "subnet_1b" {
  value = aws_subnet.vpc_subnet2.id
}

output "subnet_1c" {
  value = aws_subnet.vpc_subnet3.id
}
