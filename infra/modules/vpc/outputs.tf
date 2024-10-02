output "private_route_table_id" {
  value = aws_route_table.rtb-private.id
}

output "private_subnet_ids" {
  value = [
    aws_subnet.subnet-private1.id,
    aws_subnet.subnet-private2.id,
    aws_subnet.subnet-private3.id,
  ]
}

output "public_subnet_ids" {
  value = [
    aws_subnet.subnet-public1.id,
    aws_subnet.subnet-public2.id,
    aws_subnet.subnet-public3.id,
  ]
}

output "task_security_group_id" {
  value = aws_security_group.hello-world-task-sg.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
