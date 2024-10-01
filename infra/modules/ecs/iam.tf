resource "aws_iam_role" "ecs-task-exec-role" {
  name                = "${var.project_name}-ecs-task-exec-role-${var.environment}"
  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]

  assume_role_policy = jsonencode({
    "Version" : "2008-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    "project" : var.project_name
    "environment" : var.environment
  }
}

resource "aws_iam_role_policy" "task-exec-policy" {
  name = "${var.project_name}-task-exec-policy-${var.environment}"
  role = aws_iam_role.ecs-task-exec-role.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:CreateLogGroup"
        ],
        "Resource" : "*"
      }
    ]
  })
}
