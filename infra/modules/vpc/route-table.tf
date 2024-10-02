# Route to ngw (allows connections to internet, but keeps subnet private)
resource "aws_route_table" "rtb-private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name = "${var.project_name}-rtb-private-${var.environment}"
  }
}

# Route to igw (makes subnet public and allows inbound traffic)
resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.project_name}-rtb-public-${var.environment}"
  }
}
