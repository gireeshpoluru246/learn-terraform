variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region"
}



variable "instance_type" {
  type = map(any)
  default = {
    dev  = "t3.micro"
    prod = "t3.medium"
    uat  = "t3.small"
  }
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "roboshop-workspaces-demo"
    Environment = "dev"
    Terraform   = "true"
    Project     = "roboshop"
  }
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "from_port" {
  type    = number
  default = 0
}



variable "to_port" {
  type    = number
  default = 0
}


variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}



