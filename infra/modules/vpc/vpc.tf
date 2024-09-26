resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_range
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "${var.project_name}-vpc-${var.environment}",
    Project = var.project_name
  }
}
