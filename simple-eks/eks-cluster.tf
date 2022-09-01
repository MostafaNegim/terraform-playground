module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"
  cluster_name    = local.cluster_name
  cluster_version = "1.23"

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
}
