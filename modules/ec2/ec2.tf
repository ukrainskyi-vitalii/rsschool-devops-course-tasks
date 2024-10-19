resource "aws_instance" "private_instance_1" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_id_1
  security_groups = [var.vpc_sg_id]
  key_name        = var.ssh_key_name

  tags = {
    Name = "rs_school-private-instance-1"
  }
}

resource "aws_instance" "private_instance_2" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_id_2
  security_groups = [var.vpc_sg_id]
  key_name        = var.ssh_key_name

  tags = {
    Name = "rs_school-private-instance-2"
  }
}
