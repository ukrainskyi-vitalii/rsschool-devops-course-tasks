resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnet_1_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  security_groups             = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "rs_school-bastion-host"
  }
}

resource "aws_security_group" "bastion_sg" {
  vpc_id = module.vpc.aws_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}