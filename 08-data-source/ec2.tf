resource "aws_instance" "data-source" {
  ami           = data.aws_ami.joindevops.id

  instance_type = var.instance_type
   vpc_security_group_ids = [aws_security_group.data-souruce-sg.id] 

  
  tags = merge(
    var.common_tags,
    {
      Name = "data-source-demo"
      Component = "poc"
    }
  )
}

resource "aws_security_group" "data-souruce-sg" {
  name        = "data-souruce-sg"
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
      Name = "data-souruce-sg"
      Component = "poc"
    }
 )
}