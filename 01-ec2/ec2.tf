resource "aws_instance" "ec2-sever" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t3.micro"
   vpc_security_group_ids = [aws_security_group.ec2-server-sg.id] 

  tags = {
    Name = "ec2-server"
  }
}

resource "aws_security_group" "ec2-server-sg" {
  name        = "ec2-server-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 

  tags = {
    Name = "ec2-server-sg"
  }
}