resource "aws_security_group" "alb_sg" {
  name        = "ab1-alb-sg"
  description = "Security group for ALB"
  vpc_id      = module.vpc.vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}


