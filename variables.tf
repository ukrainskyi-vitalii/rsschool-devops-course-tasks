# ec2
variable "ami_id" {
  description = "AMI ID for eu-west-1"
  default     = "ami-054a53dca63de757b"
}

variable "ssh_key_name" {
  description = "SSH key name"
  default     = "rs-school"
}