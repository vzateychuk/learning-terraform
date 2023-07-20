output "instance_ami" {
  value = aws_instance.web.ami[0]
}

output "instance_arn" {
  value = aws_instance.web.arn[0]
}
