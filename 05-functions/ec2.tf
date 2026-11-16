resource "aws_instance" "function" {
  ami           = var.ami_id
  instance_type = var.instance_type
   vpc_security_group_ids = [aws_security_group.function-sg.id] 

  #tags = var.ec2_instance_tags

  tags = merge(
    var.common_tags,
    {
      Name = "function-demo"
      Component = "poc"
    }
  )
}

resource "aws_security_group" "function-sg" {
  name        = "function-sg"
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
 

 tags = merge(
  var.common_tags,
 {
      Name = "function-sg"
      Component = "poc"
    }
 )
}