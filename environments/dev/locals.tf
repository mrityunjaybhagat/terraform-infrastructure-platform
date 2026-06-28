locals {
  name_prefix = "terraform-infra-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Mritunjay"
  }
}
