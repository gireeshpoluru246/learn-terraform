resource "aws_instance" "provisioners" {
  ami = var.ami_id
  #instance_type          = var.instance_type
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.provisioners.id]

  tags = var.ec2_instance_tags

  #  provisioner "local-exec" {
  #   command = "echo ${self.private_ip} >> inventory.ini"
  # }

  provisioner "local-exec" {
    command = "echo Instance created"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Instance is going to be destroy' "
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }


  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf install nginx -y",
  #     "sudo systemctl start nginx",
  #     "sudo systemctl enable nginx"
  #   ]
  # }

  provisioner "file" {
    source      = "bootstrap.sh"       # Local file path
    destination = "/tmp/bootstrap.sh"       # Remote target path
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
  }

  provisioner "remote-exec" {
    when    = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }
}



resource "aws_security_group" "provisioners" {
  name        = "provisioners"
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
    {
      Name = "provisioners"
    }
  )

}

