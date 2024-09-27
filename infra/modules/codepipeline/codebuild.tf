data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

resource "aws_codebuild_project" "deploy-docker-image" {
  name          = "${var.project_name}-codebuild-deploy-docker-image-${var.environment}"
  description   = "Build docker image"
  build_timeout = "300"
  service_role  = aws_iam_role.codepipeline_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "ACCOUNT_ID"
      value = local.account_id
    }

    environment_variable {
      name  = "DEFAULT_REGION"
      value = var.region
    }

    environment_variable {
      name  = "IMAGE_NAME"
      value = "latest"
    }

    environment_variable {
      name  = "COMMIT_ID"
      value = "#{SourceVariables.CommitId}"
    }
  }

  source_version = "master"

  source {
    type      = "CODEPIPELINE"
    buildspec = "terraform/modules/codepipeline/buildspec/deploy-docker-image.yml"
  }
}
