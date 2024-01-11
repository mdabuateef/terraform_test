output "alb_info" {
  value = aws_lb.load-balancer
  description = "load balancer info"
}

output "target_group" {
  value = aws_lb_target_group.http-tg
  description = "target grp info"
}
