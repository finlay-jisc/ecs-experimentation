output "private_subnet_ids" {
  value = [
    aws_subnet.subnet-private1.id,
    aws_subnet.subnet-private2.id,
    aws_subnet.subnet-private3.id,
  ]
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
