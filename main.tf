provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "/home/ec2-user/terraform/terraform_7/vpc"
}

module "asg" {
  source = "/home/ec2-user/terraform/terraform_7/asg"
  vpc_id = module.vpc.vpc.id
}

module "alb" {
  source = "/home/ec2-user/terraform/terraform_7/alb"
  vpc_id = module.vpc.vpc.id
  subnets = module.vpc.public_subnet_ids
}
