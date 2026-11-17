resource "aws_instance" "state_demo" {
  ami = data.aws_ami.joindevops.id

  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.state-demo-sg.id]


  tags = merge(
    var.common_tags,
    {
      Name      = "state_demo"
      Component = "poc"
    }
  )
}

resource "aws_security_group" "state-demo-sg" {
  name        = "state_demo_sg"
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
    var.common_tags,
    {
      Name      = "state_demo_sg"
      Component = "poc"
    }
  )
  lifecycle {
    create_before_destroy = true
  }

}

