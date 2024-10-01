resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_range
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc-${var.environment}",
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
