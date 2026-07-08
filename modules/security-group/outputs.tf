output "bastion_sg_id" {
  description = "Security Group ID for the bastion host"
  value       = aws_security_group.bastion.id
}

output "private_ec2_sg_id" {
  description = "Security Group ID for the private EC2 instance"
  value       = aws_security_group.private_ec2.id
}