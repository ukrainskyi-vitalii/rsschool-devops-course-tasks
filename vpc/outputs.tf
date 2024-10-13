output "aws_vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.rs_school_vpc.id
}

output "public_subnet_1_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnet_2.id
}

output "vpc_sg_id" {
  description = "VPC security group ID"
  value       = aws_security_group.vpc_sg.id
}

output "private_subnet_1_cidr" {
  value = aws_subnet.private_subnet_1.cidr_block
}

output "private_subnet_2_cidr" {
  value = aws_subnet.private_subnet_2.cidr_block
}

output "aws_vpc_cidr" {
  value = aws_vpc.rs_school_vpc.cidr_block
}
