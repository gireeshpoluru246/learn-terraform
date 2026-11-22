variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "aws region"
}

variable  "instance_type" {
  type        = string
}

variable "environment" {
    type = string
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-tfvars-demo"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}