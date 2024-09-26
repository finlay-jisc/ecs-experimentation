locals {
  project_name = "finlay-ecs-experimentation"
  environment  = terraform.workspace
}

module "vpc" {
  source         = "../modules/vpc"
  environment    = local.environment
  project_name   = local.project_name
  vpc_cidr_range = var.vpc_cidr_range
}

module "ecs" {
  source       = "../modules/ecs"
  environment  = local.environment
  project_name = local.project_name
  vpc_id       = module.vpc.vpc_id
}

module "ecr" {
  source       = "../modules/ecr"
  environment  = local.environment
  project_name = local.project_name
}

module "codepipeline" {
  source       = "../modules/codepipeline"
  environment  = local.environment
  project_name = local.project_name
}
