resource "aws_security_group" "hello-world-task-sg" {
  name                   = "${var.project_name}-hello-world-task-sg-${var.environment}"
  description            = "Security group for hello world ecs service"
  vpc_id                 = aws_vpc.vpc.id
  revoke_rules_on_delete = true

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-hello-world-task-sg-${var.environment}"
  }
}
