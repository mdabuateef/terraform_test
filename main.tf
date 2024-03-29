provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./vpc"
}

module "asg" {
  source = "./asg"
  public_subnet_1_id = module.vpc.public_subnet_1.id
  public_subnet_2_id = module.vpc.public_subnet_2.id
  target_group_arn = module.alb.target_group.arn
  pub-sg-1 = module.sg.Security_grp.id
}

module "alb" {
  source = "./alb"
  security_groups = module.sg.Security_grp.id
  vpc_id = module.vpc.vpc.id
  subnet_1_id = module.vpc.public_subnet_1.id
  subnet_2_id = module.vpc.public_subnet_2.id
}

module "sg" {
  source = "./scrt_grp"
  vpc_id = module.vpc.vpc.id
}

# module "scrt_grp" {
#   source = "./scrt_grp"
#   vpc_id = module.vpc.vpc.id
# }