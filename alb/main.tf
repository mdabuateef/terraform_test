resource "aws_lb" "load-balancer" {
  name               = "ab1-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  enable_deletion_protection = true
  subnets = [ var.subnet_1_id , var.subnet_2_id  ]
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
  vpc_id   = var.vpc_id
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
