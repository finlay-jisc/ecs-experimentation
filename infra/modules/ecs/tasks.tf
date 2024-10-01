data "aws_caller_identity" "current" {}
locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_ecs_task_definition" "hello-world" {
  family                   = "${var.project_name}-hello-world-${var.environment}"
  requires_compatibilities = ["FARGATE"]

  cpu    = 256
  memory = 512

  network_mode = "awsvpc"

  execution_role_arn = resource.aws_iam_role.ecs-task-exec-role.arn
  task_role_arn      = resource.aws_iam_role.ecs-task-role.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      "name" : "hello-world",
      "image" : "${local.account_id}.dkr.ecr.${var.region}.amazonaws.com/finlay-ecs-experimentation-ecr-test:latest",
      "entryPoints" : [
        "sh", "-c"
      ],
      "essential" : true,
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-create-group" : "true",
          "awslogs-group" : "/ecs/hello-world",
          "awslogs-region" : "${var.region}",
          "awslogs-stream-prefix" : "ecs"
        },
        "secretOptions" : []
      }
    }
  ])
}
