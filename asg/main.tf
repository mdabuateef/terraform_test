resource "aws_launch_configuration" "launch-template" {
  name_prefix   = "example"
  image_id      = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier = [module.vpc.public_subnet_1.id , module.vpc.public_subnet_2.id]
  target_group_arns = [module.alb.target_group.arn]

  launch_configuration = aws_launch_configuration.launch-template.name
}

