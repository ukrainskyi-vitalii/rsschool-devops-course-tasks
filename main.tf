module "vpc" {
  source = "./vpc"

  bastion_private_ip = aws_instance.bastion.private_ip
}

module "security" {
  source = "./modules/security"

  vpc_id              = module.vpc.aws_vpc_id
  public_subnet_id_1  = module.vpc.public_subnet_1_id
  public_subnet_id_2  = module.vpc.public_subnet_2_id
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
}

module "nat_gateway" {
  source = "./nat_gateway"

  vpc_id              = module.vpc.aws_vpc_id
  public_subnet_id_1  = module.vpc.public_subnet_1_id
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
}

module "nacl" {
  source = "./nacl"

  vpc_id              = module.vpc.aws_vpc_id
  vpc_cidr            = module.vpc.aws_vpc_cidr
  public_subnet_id_1  = module.vpc.public_subnet_1_id
  public_subnet_id_2  = module.vpc.public_subnet_2_id
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
}