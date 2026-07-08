# Terraform Infrastructure Platform

## Project Overview

## Project Goals

## Architecture

## Repository Structure

## Technologies Used

## Project Roadmap

## Learning Objectives

## Progress Tracker

## License




# Challenges Faced

## 1. IAM Permission Denied

**Issue:**
Terraform failed to create an IAM Role with the following error:

```
AccessDenied: User is not authorized to perform iam:CreateRole
```

**Cause:**
The AWS IAM user used for deployment (`ansible_user`) did not have permission to create IAM resources.

**Resolution:**
The IAM module was temporarily removed from the deployment so the remaining infrastructure could be completed successfully. The project documentation notes that an administrator account or additional IAM permissions are required to enable this module.

**Lesson Learned:**
Always verify IAM permissions before implementing resources that require elevated privileges.

---

## 2. Lost EC2 Key Pair

**Issue:**
The original AWS key pair (`terraform-mission-key`) existed in AWS, but the corresponding private `.pem` file was no longer available.

**Cause:**
AWS stores only the public key. The private key is downloadable only once at creation.

**Resolution:**
Created a new key pair (`terraform-infra-key`), stored the private key securely, updated Terraform variables, and added `*.pem` to `.gitignore`.

**Lesson Learned:**
Always back up private key files securely because they cannot be recovered.

---

## 3. SSH Connection Timeout

**Issue:**
SSH connection to the Bastion Host timed out.

**Cause:**
The Security Group allowed SSH only from an outdated public IP address.

**Resolution:**
Retrieved the current public IPv4 address using:

```bash
curl -4 ifconfig.me
```

Updated `allowed_ssh_cidr` in `terraform.tfvars`, applied the Terraform changes, and successfully connected.

**Lesson Learned:**
When using IP-restricted Security Groups, changes in your public IP require updating the allowed CIDR and reapplying Terraform.

---

## 4. Missing Terraform Outputs

**Issue:**
`terraform output` initially displayed "No outputs found."

**Cause:**
Outputs had not yet been defined for the environment.

**Resolution:**
Added environment outputs referencing the EC2 module outputs and reapplied the configuration.

**Lesson Learned:**
Module outputs expose values only to the calling module. Environment-level outputs are required to display them after deployment.

---

## 5. Module Integration Errors

**Issue:**
Terraform reported undeclared variable references while integrating the IAM and EC2 modules.

**Cause:**
Variables and module inputs became inconsistent after temporarily removing the IAM module.

**Resolution:**
Removed obsolete references, validated the configuration, and confirmed the deployment using `terraform plan` before applying.

**Lesson Learned:**
Whenever a module interface changes, update all dependent modules to keep inputs and outputs synchronized.

