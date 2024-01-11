provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./vpc"
}

module "asg" {
  source = "./asg"
}

module "alb" {
  source = "./alb"
}

module "sg" {
  source = "./scrt_grp"
}