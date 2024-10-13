resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnet_1_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  security_groups             = [module.security.public_sg_id]

  tags = {
    Name = "rs_school-bastion-host"
  }
}