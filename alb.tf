module "web_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "alb"

  load_balancer_type = "application"

  vpc_id          = module.web_vpc.vpc_id
  subnets         = module.web_vpc.public_subnets
  security_groups = [module.web_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "web-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = aws_instance.web.id
          port      = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Name        = "web-${var.environment.name}-alb"
    Environment = "${var.environment.name}"
  }
}