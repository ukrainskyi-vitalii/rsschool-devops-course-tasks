resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id_1

  tags = {
    Name = "rs_school-nat-gateway"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "rs_school-private-rt"
  }
}

resource "aws_route_table_association" "private_rt_assoc_1" {
  subnet_id      = var.private_subnet_id_1
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_assoc_2" {
  subnet_id      = var.private_subnet_id_2
  route_table_id = aws_route_table.private_rt.id
}
