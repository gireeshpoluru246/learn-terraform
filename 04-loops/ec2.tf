resource "aws_instance" "roboshop" {
  #count = 5
  count = length(var.instances)
  ami           = var.ami_id
  instance_type =  var.instance_type
   vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.roboshop[count.index].id
    ] 

  tags = {
    Name = "${var.project}-${var.enviornment}-${var.instances[count.index]}"
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
  count = 5
  name        =  "${var.project}-${var.enviornment}-${var.instances[count.index]}" 
  description = "Allow TLS inbound traffic and all outbound traffic"

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr
  }

 

  tags = {
    Name = "${var.project}-${var.enviornment}-${var.instances[count.index]}"
  }
}