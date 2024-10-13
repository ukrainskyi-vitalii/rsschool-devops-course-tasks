resource "aws_network_acl" "public_acl" {
  vpc_id = var.vpc_id

  # Inbound Rules
  ingress {
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 80  # HTTP
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 110
    cidr_block = "0.0.0.0/0"
    from_port  = 443  # HTTPS
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    action     = "allow"
    rule_no    = 120
    cidr_block = "0.0.0.0/0"
    from_port  = 22  # SSH
    to_port    = 22
  }

  // Allow ping
  ingress {
    protocol   = "icmp"
    action     = "allow"
    rule_no    = 140
    cidr_block = "0.0.0.0/0"
    from_port  = 8
    to_port    = 0
  }

  // Allow all outbound traffic
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # Outbound traffic to a private subnet
  egress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    var.public_subnet_id_1,
    var.public_subnet_id_2
  ]

  tags = {
    Name = "public-acl"
  }
}

resource "aws_network_acl" "private_acl" {
  vpc_id = var.vpc_id

  # Inbound Rules
  ingress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  # Outbound Rules
  egress {
    protocol   = "-1"
    action     = "allow"
    rule_no    = 100
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    var.private_subnet_id_1,
    var.private_subnet_id_2
  ]

  tags = {
    Name = "private-acl"
  }
}

