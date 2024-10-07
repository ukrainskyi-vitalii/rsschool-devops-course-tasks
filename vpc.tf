resource "aws_vpc" "rsschool_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = {
    Name = "rsschool_vpc"
  }
}

# Internet Gateway for the public subnet
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.rsschool_vpc.id
  tags   = {
    Name = "rsschool_igw"
  }
}

# Public subnets
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.rsschool_vpc.id
  cidr_block        = var.public_subnet_1_cidr
  availability_zone = var.availability_zones[0]
  tags              = {
    Name = "public-terraform-rsschool-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.rsschool_vpc.id
  cidr_block        = var.public_subnet_2_cidr
  availability_zone = var.availability_zones[1]
  tags              = {
    Name = "public-terraform-rsschool-subnet-2"
  }
}

# Private subnets
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.rsschool_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zones[0]
  tags              = {
    Name = "private-terraform-rsschool-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.rsschool_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zones[1]
  tags              = {
    Name = "private-terraform-rsschool-subnet-2"
  }
}