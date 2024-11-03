variable "ami_id" {
  description = "AMI ID for eu-west-1"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key name"
  type        = string
}

variable "private_subnet_id_1" {
  description = "Private subnet ID"
  type        = string
}

variable "private_subnet_id_2" {
  description = "Private subnet ID"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}