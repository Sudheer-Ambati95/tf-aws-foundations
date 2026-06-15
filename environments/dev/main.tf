module "vpc" {

  source = "../../modules/vpc"

  environment = "dev"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_1_cidr = "10.0.1.0/24"
  public_subnet_2_cidr = "10.0.2.0/24"

  private_app_subnet_1_cidr = "10.0.11.0/24"
  private_app_subnet_2_cidr = "10.0.12.0/24"

  private_db_subnet_1_cidr = "10.0.21.0/24"
  private_db_subnet_2_cidr = "10.0.22.0/24"
}

module "security_group" {

  source = "../../modules/security-group"

  environment = "dev"

  vpc_id = module.vpc.vpc_id
}

module "monitoring" {

  source = "../../modules/monitoring"

  environment = "dev"

  vpc_id = module.vpc.vpc_id

  instance_id = module.ec2.instance_id
}

module "ec2" {

  source = "../../modules/ec2"

  environment = "dev"

  private_subnet_id = module.vpc.private_app_subnet_1_id

  app_security_group_id = module.security_group.app_sg_id
}

module "backup" {
  source = "../../modules/backup"

  environment = "dev"

  instance_arn = module.ec2.instance_arn
}

