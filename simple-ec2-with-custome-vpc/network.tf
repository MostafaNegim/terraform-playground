resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "vpc"
  }
}

# subnets
resource "aws_subnet" "subnet" {
  cidr_block = "${cidrsubnet(aws_vpc.vpc.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.vpc.id}"
  availability_zone = "${var.region}a"
}

