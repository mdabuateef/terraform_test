output "launch-template"{
value = aws_launch_configuration.launch-template
}

output "asg"{
value = aws_autoscaling_group.asg
}
