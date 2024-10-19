module "vpc" {
  source = "./vpc"

  bastion_private_ip = aws_instance.bastion.private_ip
}

module "security" {
  source = "./modules/sg"

  vpc_id              = module.vpc.aws_vpc_id
  public_subnet_id_1  = module.vpc.public_subnet_1_id
#  public_subnet_id_2  = module.vpc.public_subnet_2_id
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
  vpc_cidr            = module.vpc.aws_vpc_cidr
}

module "nat_gateway" {
  source = "./nat_gateway"

  vpc_id              = module.vpc.aws_vpc_id
  public_subnet_id_1  = module.vpc.public_subnet_1_id
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
}

/*module "ec2" {
  source = "./modules/ec2"

  ami_id              = var.ami_id
  ssh_key_name        = var.ssh_key_name
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
  vpc_sg_id           = module.vpc.vpc_sg_id
}*/

module "k3s" {
  source = "./modules/k3s"

  ami_id              = var.ami_id
  vpc_id              = module.vpc.aws_vpc_id
  vpc_cidr            = module.vpc.aws_vpc_cidr
  ssh_key_name        = var.ssh_key_name
  private_subnet_id_1 = module.vpc.private_subnet_1_id
  private_subnet_id_2 = module.vpc.private_subnet_2_id
}