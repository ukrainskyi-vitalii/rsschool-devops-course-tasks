output "public_sg_id" {
  description = "Public security group ID"
  value       = aws_security_group.public_sg.id
}
