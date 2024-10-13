resource "aws_instance" "public_instance_1" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnet_1_id
  security_groups             = [module.security.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name

  tags = {
    Name = "rs_school-public-instance-1"
  }
}

resource "aws_instance" "public_instance_2" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnet_2_id
  security_groups             = [module.security.public_sg_id]
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name

  tags = {
    Name = "rs_school-public-instance-2"
  }
}

resource "aws_instance" "private_instance_1" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = module.vpc.private_subnet_1_id
  security_groups = [module.vpc.vpc_sg_id]
  key_name        = var.ssh_key_name

  tags = {
    Name = "rs_school-private-instance-1"
  }
}

resource "aws_instance" "private_instance_2" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = module.vpc.private_subnet_2_id
  security_groups = [module.vpc.vpc_sg_id]
  key_name        = var.ssh_key_name

  tags = {
    Name = "rs_school-private-instance-2"
  }
}
