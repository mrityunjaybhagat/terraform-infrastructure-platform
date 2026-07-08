module "vpc" {
  source = "../../modules/vpc"

  name_prefix         = local.name_prefix
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "ap-south-1a"

  common_tags = local.common_tags
}

module "security_group" {
  source = "../../modules/security-group"

  name_prefix      = local.name_prefix
  vpc_id           = module.vpc.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr

  common_tags = local.common_tags
}