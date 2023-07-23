variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
  description = "Name filter and owner for ami"

  type = object({
    name  = string
    owner = string
  })

  default = {
    name  = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
    owner = "979382823631" # Bitnami
  }
}

variable "environment" {
  description = "Application environment for which network created"

  type = object({
    name               = string
    ingress_cidr_block = string
  })

  default = {
    name               = "dev"
    ingress_cidr_block = "37.214.0.0/16"
  }
}