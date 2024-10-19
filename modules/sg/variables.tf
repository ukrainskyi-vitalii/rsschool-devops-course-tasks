variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_id_1" {
  description = "Public subnet ID"
  type        = string
}

#variable "public_subnet_id_2" {
#  description = "Public subnet ID"
#  type        = string
#}

variable "private_subnet_id_1" {
  description = "Private subnet ID"
  type        = string
}

variable "private_subnet_id_2" {
  description = "Private subnet ID"
  type        = string
}

variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}

#variable "public_subnet_2_cidr" {
#  description = "CIDR Block for Public Subnet 2"
#  default     = "10.0.2.0/24"
#}

variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.4.0/24"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}