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
  public_subnet_ids  = module.vpc.public_subnet_ids
  region             = local.region
  security_group_id  = module.vpc.task_security_group_id
  vpc_id             = module.vpc.vpc_id
}

module "ecr" {
  source                 = "../modules/ecr"
  environment            = local.environment
  private_route_table_id = module.vpc.private_route_table_id
  private_subnet_ids     = module.vpc.private_subnet_ids
  project_name           = local.project_name
  region                 = local.region
  task_security_group_id = module.vpc.task_security_group_id
  vpc_id                 = module.vpc.vpc_id
}

module "codepipeline" {
  count        = local.environment == "test" ? 1 : 0
  source       = "../modules/codepipeline"
  environment  = local.environment
  project_name = local.project_name
  region       = local.region
}
