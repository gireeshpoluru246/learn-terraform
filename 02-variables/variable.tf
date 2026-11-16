variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "aws region"
}

variable "ami_id" {
  type = string
  default = "ami-0055977a6e828a4f4"
  description = "ami_id"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "instance_type"

   validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "Instance type must be t3.micro, t3.small,t3.medium."
  }
}

variable "ec2_instance_tags" {
  type = map
  default = {
    Name = "ec2-server"
    Enviornment = "dev"
    terraform = "true"
    application = "roboshop"
  }
  
}

variable "from_port" {
  type = number
  default = 0
}

variable "to_port" {
  type = number
  default = 0
}

variable "cidr" {
  type = list(string)
  default = ["0.0.0.0/0"]
}