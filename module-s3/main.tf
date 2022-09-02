provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  for_each               = toset(["one", "two"])
  name                   = "my-ec2-cluster-${each.key}"
  ami                    = data.aws_ami.ubuntu_amis
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_vpc_default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = var.ec2_tags
}

data "aws_ami" "ubuntu_amis" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] # Canonical
}
