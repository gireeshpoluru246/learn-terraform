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

variable "enviornment" {
   type = string
   default = "dev"
  
}

variable "project" {
  type = string
  default = "roboshop"
}

variable "instances" {
  type = map
  
  default = {
    mangodb = {
       instance_type = "t3.micro"
       port_no = 27017

    },
    mysql = {
      instance_type = "t3.micro"
      port_no = 3306
    },
    rabbitmq = {
      instance_type = "t3.small"
      port_no = 5672

    },
    frontend = {
     instance_type = "t3.small"
     port_no = 80
    }
  }

}

variable "zone_id" {
  type = string
  default = "Z057584316VZ6IZU73EL"
}

variable "domain_name" {
  type = string
  default = "expenses123.store"

}