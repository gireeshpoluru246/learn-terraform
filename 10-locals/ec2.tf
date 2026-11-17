resource "aws_instance" "locals_demo" {
  ami                    = var.ami_id
  #instance_type          = var.instance_type
  instance_type =  local.instance_type
  vpc_security_group_ids = [aws_security_group.locals_demo_sg.id]

   tags = local.ec2_tags
  
}

resource "aws_security_group" "locals_demo_sg" {
  name        = "locals_demo_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = merge(
    local.common_tags,
    {
      Name = "roboshop-locals-demo"
    }
  )

}

