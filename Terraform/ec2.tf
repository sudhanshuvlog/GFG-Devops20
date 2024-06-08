resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_amaon_linux_id.id
  instance_type = var.instance_type
  key_name = var.KeyName
  tags = {
    Name = "${var.tagName}-${count.index}"
  }
  depends_on = [ aws_key_pair.deployer ]
  count =1
  subnet_id     = aws_subnet.mygfgSubnet.id
  vpc_security_group_ids = [aws_security_group.example.id]
}

resource "aws_key_pair" "deployer" {
  key_name   = var.KeyName
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_security_group" "example" {
  # ... other configuration ...
  name        = var.sgName
  description = "Allowed Port 80"
  vpc_id      = aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = var.sg_allowed_port
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }
}