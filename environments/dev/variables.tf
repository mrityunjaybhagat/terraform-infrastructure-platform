variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "terraform-infrastructure-platform"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
variable "allowed_ssh_cidr" {
  description = "Public IP allowed to SSH into Bastion"
  type        = string
}