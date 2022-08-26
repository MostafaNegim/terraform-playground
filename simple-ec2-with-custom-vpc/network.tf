resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "vpc"
  }
}

# subnets
resource "aws_subnet" "subnet" {
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 3, 1)
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "${var.region}a"
}
# sg
resource "aws_security_group" "sg" {
  name   = "sg"
  vpc_id = aws_vpc.vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Ingress Description"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Egress Description"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}
# eip
resource "aws_eip" "eip" {
  instance = aws_instance.ec2.id
  vpc      = true
}

# gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "route_table"
  }
}

resource "aws_route_table_association" "rt_association" {
  subnet_id = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.rt.id}"
}
