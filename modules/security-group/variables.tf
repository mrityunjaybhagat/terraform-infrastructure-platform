variable "name_prefix" {
  description = "Prefix used for naming security group resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into bastion host"
  type        = string
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}