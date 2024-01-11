resource "aws_lb" "load-balancer" {
  name               = "ab1-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.sg.asg.id]
  enable_deletion_protection = true

  enable_cross_zone_load_balancing = true

  access_logs {
    bucket  = "ab1-alb-logs"
    prefix  = "logs/"
    enabled = true
  }
}

resource "aws_lb_target_group" "http-tg" {
  name     = "ab1-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc.id
}

resource "aws_lb_listener" "http-listner"{
load_balancer_arn = aws_lb.load-balancer.arn
port = "80"
protocol = "HTTP"
default_action {
type = "forward"
target_group_arn = aws_lb_target_group.http-tg.arn
}

}
