data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "web" {
  name        = "web_sec_group"
  description = "Allow http, https, ssh in. Allow all out"

  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group_rule" "http_in" {

  description = "Allow http (80) in"

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["37.214.0.0/16"]

  security_group_id = aws_security_group.web.id

}

resource "aws_security_group_rule" "https_in" {

  description = "Allow https (443) in"

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["37.214.0.0/16"]

  security_group_id = aws_security_group.web.id

}

resource "aws_security_group_rule" "ssh_in" {

  description = "Allow ssh (22) in"

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["37.214.0.0/16"]

  security_group_id = aws_security_group.web.id

}

resource "aws_security_group_rule" "everythig_out" {

  description = "Allow any traffic out"

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.web.id

}