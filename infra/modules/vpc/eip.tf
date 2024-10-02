resource "aws_eip" "eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip-${var.region}a-${var.environment}"
  }
}
