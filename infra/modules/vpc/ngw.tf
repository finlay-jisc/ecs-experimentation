# nat gateway lives in one of the public subnets. private subnets route to ngw which has outbound access via public subnets route to igw

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet-public1.id

  tags = {
    Name = "${var.project_name}-ngw-public1-${var.region}a-${var.environment}"
  }
}
