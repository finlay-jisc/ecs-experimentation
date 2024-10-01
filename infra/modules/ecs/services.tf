resource "aws_ecs_service" "hello-world" {
  name                   = "${var.project_name}-hello-world-${var.environment}"
  cluster                = aws_ecs_cluster.ecs.id
  task_definition        = "${aws_ecs_task_definition.hello-world.id}:${aws_ecs_task_definition.hello-world.revision}"
  enable_execute_command = true
  launch_type            = "FARGATE"

  network_configuration {
    subnets = var.private_subnet_ids
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
}
