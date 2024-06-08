data "aws_ami" "latest_amaon_linux_id" {
  most_recent = true

  owners = ["amazon"]
  filter {
    name = "name"
    values =["al2023-ami-2023.*-x86_64"]
  }

  filter{
    name   = "root-device-type"
    values = ["ebs"]
  }
  
   filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}
