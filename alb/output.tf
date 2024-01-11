output "alb_id" {
  value = aws_lb.example.id
}

output "target_group_arn" {
  value = aws_lb_target_group.example.arn
}

