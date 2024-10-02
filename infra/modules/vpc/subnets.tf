resource "aws_subnet" "subnet-public1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 0)
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.project_name}-subnet-public1-${var.region}a-${var.environment}",
  }
}

resource "aws_subnet" "subnet-public2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 1)
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.project_name}-subnet-public2-${var.region}a-${var.environment}",
  }
}

resource "aws_subnet" "subnet-public3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 2)
  availability_zone = "${var.region}c"

  tags = {
    Name = "${var.project_name}-subnet-public3-${var.region}a-${var.environment}",
  }
}

resource "aws_subnet" "subnet-private1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 3)
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.project_name}-subnet-private1-${var.region}a-${var.environment}",
  }
}

resource "aws_subnet" "subnet-private2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 4)
  availability_zone = "${var.region}b"

  tags = {
    Name = "${var.project_name}-subnet-private2-${var.region}a-${var.environment}",
  }
}

resource "aws_subnet" "subnet-private3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr_range, 8, 5)
  availability_zone = "${var.region}c"

  tags = {
    Name = "${var.project_name}-subnet-private3-${var.region}a-${var.environment}",
  }
}

# Associate subnets with route tables (this lot could arguably go in this file, in rtb file or in their own file..)
resource "aws_route_table_association" "rtb-assoc-subnet-private1-rtb-private" {
  subnet_id      = aws_subnet.subnet-private1.id
  route_table_id = aws_route_table.rtb-private.id
}

resource "aws_route_table_association" "rtb-assoc-subnet-private2-rtb-private" {
  subnet_id      = aws_subnet.subnet-private2.id
  route_table_id = aws_route_table.rtb-private.id
}

resource "aws_route_table_association" "rtb-assoc-subnet-private3-rtb-private" {
  subnet_id      = aws_subnet.subnet-private3.id
  route_table_id = aws_route_table.rtb-private.id
}

resource "aws_route_table_association" "rtb-assoc-subnet-public1-rtb-public" {
  subnet_id      = aws_subnet.subnet-public1.id
  route_table_id = aws_route_table.rtb-public.id
}

resource "aws_route_table_association" "rtb-assoc-subnet-public2-rtb-public" {
  subnet_id      = aws_subnet.subnet-public2.id
  route_table_id = aws_route_table.rtb-public.id
}

resource "aws_route_table_association" "rtb-assoc-subnet-public3-rtb-public" {
  subnet_id      = aws_subnet.subnet-public3.id
  route_table_id = aws_route_table.rtb-public.id
}
