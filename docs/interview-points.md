## Why use terraform.tfvars instead of hardcoding values?

Using `terraform.tfvars` separates configuration from code. The same Terraform configuration can be reused across multiple environments (dev, staging, prod) by changing only the variable values instead of modifying the code.