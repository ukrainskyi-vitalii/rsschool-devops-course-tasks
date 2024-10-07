resource "aws_vpc" "rsschool_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "rsschool_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.rsschool_vpc.id
  tags = {
    Name = "rsschool_igw"
  }
}