variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "github_repo_name" {
  description = "GitHub Repository Name (owner/repo)"
  type        = string
}

# networking

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  default     = "10.0.0.0/16"
}