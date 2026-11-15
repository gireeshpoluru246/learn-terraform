resource "aws_instance" "ec2-sever" {
  ami           = var.ami_id
  instance_type = var.instance_type
   vpc_security_group_ids = [aws_security_group.ec2-server-sg.id] 

  tags = var.ec2_instance_tags
}

resource "aws_security_group" "ec2-server-sg" {
  name        = "ec2-server-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

    ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }
 

  tags = {
    Name = "ec2-server-sg"
  }
}