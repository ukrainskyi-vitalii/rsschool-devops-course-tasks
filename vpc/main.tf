# VPC
resource "aws_vpc" "rs_school_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = {
    Name = "rs_school-vpc"
  }
}

# Public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.rs_school_vpc.id
  cidr_block              = var.public_subnet_1_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zones[0]
  tags                    = {
    Name = "public-terraform-rs_school-subnet-1"
  }
}

#resource "aws_subnet" "public_subnet_2" {
#  vpc_id            = aws_vpc.rs_school_vpc.id
#  cidr_block        = var.public_subnet_2_cidr
#  availability_zone = var.availability_zones[1]
#  tags = {
#    Name = "public-terraform-rs_school-subnet-2"
#  }
#}

# Private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.rs_school_vpc.id
  cidr_block        = var.private_subnet_1_cidr
  availability_zone = var.availability_zones[0]
  tags              = {
    Name = "private-terraform-rs_school-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.rs_school_vpc.id
  cidr_block        = var.private_subnet_2_cidr
  availability_zone = var.availability_zones[1]
  tags              = {
    Name = "private-terraform-rs_school-subnet-2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.rs_school_vpc.id
  tags   = {
    Name = "rs_school-igw"
  }
}

# Security Group
resource "aws_security_group" "vpc_sg" {
  name        = "vpc_security_group"
  description = "Allow all inbound traffic within VPC"
  vpc_id      = aws_vpc.rs_school_vpc.id

  ingress {
    description = "Allow SSH from Bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [format("%s/32", var.bastion_private_ip)]
  }

  ingress {
    description = "Allow all traffic within VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"            # All protocols
    cidr_blocks = ["10.0.0.0/16"] # All instances in VPC
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Internet outbound access
  }

  tags = {
    Name = "vpc_security_group"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.rs_school_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rs_school-public-rt"
  }
}

resource "aws_route_table_association" "public_rt_assoc_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

#resource "aws_route_table_association" "public_rt_assoc_2" {
#  subnet_id      = aws_subnet.public_subnet_2.id
#  route_table_id = aws_route_table.public_rt.id
#}
