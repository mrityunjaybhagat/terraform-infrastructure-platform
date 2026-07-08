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

module "ec2" {
  source = "../../modules/ec2"

  name_prefix       = local.name_prefix
  instance_type     = var.instance_type
  key_name          = var.key_name
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  bastion_sg_id     = module.security_group.bastion_sg_id
  private_ec2_sg_id = module.security_group.private_ec2_sg_id
  common_tags       = local.common_tags
}