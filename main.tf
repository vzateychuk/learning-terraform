data "aws_ami" "webserver_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_filter.name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_filter.owner]
}

resource "aws_instance" "web" {

  ami           = data.aws_ami.webserver_ami.id
  instance_type = var.instance_type

  vpc_security_group_ids = [module.web_sg.security_group_id]

  tags = {
    Name        = "web_${var.environment.name}"
    Env         = "${var.environment.name}"
    Environment = "${var.environment.name}"
  }
}
