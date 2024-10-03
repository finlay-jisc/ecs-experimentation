resource "aws_ecs_service" "hello-world" {
  name                   = "${var.project_name}-hello-world-${var.environment}"
  cluster                = aws_ecs_cluster.ecs.id
  task_definition        = "${aws_ecs_task_definition.hello-world.id}:${aws_ecs_task_definition.hello-world.revision}"
  enable_execute_command = true
  launch_type            = "FARGATE"
  desired_count          = 1

  network_configuration {
    assign_public_ip = true
    subnets          = var.public_subnet_ids
    security_groups  = [var.security_group_id]
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
}
