provider "aws" {
  region  = "eu-west-1"
  profile = var.profile
}

terraform {
  required_version = ">=1.5.1"
  backend "s3" {
    bucket  = "finlay-ecs-experimentation-tfstate"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    profile = "aws-training"
  }
  required_providers {
    aws = {
      version = ">=5.5.0"
      source  = "hashicorp/aws"
    }
  }
}
