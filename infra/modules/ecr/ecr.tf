resource "aws_ecr_repository" "finlay_ecs_experimentation" {
  name                 = "${var.project_name}-ecr-${var.environment}"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
