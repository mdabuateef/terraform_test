resource "aws_launch_template" "launch-template"{
  name = "nginx-lt"
    block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 8
    }
  }
  image_id = "ami-0d3f444bc76de0a79"
  instance_type = "t2.micro"
  key_name = "test"
    network_interfaces {
    associate_public_ip_address = true
    device_index = 0
    security_groups = [ var.pub-sg-1 ]
  }
  user_data = base64encode(<<-EOF
  #!/bin/bash
  yum install nginx -y
  systemctl start nginx
  systemctl enable nginx
    EOF
  )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier = [var.public_subnet_1_id , var.public_subnet_1_id]
  target_group_arns = [var.target_group_arn]

  launch_configuration = aws_launch_template.launch-template.name
}

