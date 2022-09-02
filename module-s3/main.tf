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
  version = "4.1.4"

  for_each               = toset([1, 2])
  name                   = "my-ec2-cluster-${each.key}"
  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_vpc_default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = var.ec2_tags
}
