locals {
  environment  = terraform.workspace
  project_name = "finlay-ecs-experimentation"
  region       = "eu-west-1"
}

module "vpc" {
  source         = "../modules/vpc"
  environment    = local.environment
  project_name   = local.project_name
  region         = local.region
  vpc_cidr_range = var.vpc_cidr_range
}

module "ecs" {
  source             = "../modules/ecs"
  environment        = local.environment
  private_subnet_ids = module.vpc.private_subnet_ids
  project_name       = local.project_name
  region             = local.region
  vpc_id             = module.vpc.vpc_id
}

module "ecr" {
  source       = "../modules/ecr"
  environment  = local.environment
  project_name = local.project_name
}

module "codepipeline" {
  count        = local.environment == "test" ? 1 : 0
  source       = "../modules/codepipeline"
  environment  = local.environment
  project_name = local.project_name
  region       = local.region
}
