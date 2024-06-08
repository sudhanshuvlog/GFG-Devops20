resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "mygfgvpc"
  }
}

resource "aws_subnet" "mygfgSubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "gfgpublicsubnet"
  }
}

resource "aws_internet_gateway" "mygfgigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "mygfgigw"
  }
}

resource "aws_route_table" "mygfgRoute" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygfgigw.id
  }
  tags = {
    Name = "myGfgRouteTable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mygfgSubnet.id
  route_table_id = aws_route_table.mygfgRoute.id
}