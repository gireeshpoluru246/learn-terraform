resource "aws_instance" "roboshop" {
  
  for_each = var.instances # terraform will give a special variable each

  ami           = var.ami_id
  instance_type =  var.instance_type
   vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.roboshop[each.key].id
    ] 

  tags = {
    Name = "${var.project}-${var.enviornment}-${each.key}"
  }
}

resource "aws_security_group" "common" {
  name        =  "${var.project}-${var.enviornment}-common"
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

 

  tags = {
    Name = "${var.project}-${var.enviornment}-common"
  }
}


resource "aws_security_group" "roboshop" {
  for_each = var.instances # terraform will give a special variable each
  name        =  "${var.project}-${var.enviornment}-${each.key}" 
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

 

  tags = {
    Name = "${var.project}-${var.enviornment}-${each.key}"
  }
}