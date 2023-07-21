data "aws_vpc" "default_vpc" {
  default = true
}

module "web_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name    = "web_module_sec_group"
  description = "Module with security group"

  vpc_id = data.aws_vpc.default_vpc.id

  ingress_rules       = ["http-80-tcp", "https-443-tcp", "ssh-tcp"]
  ingress_cidr_blocks = ["37.214.0.0/16"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]
}
