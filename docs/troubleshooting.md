## S3 Backend Creation AccessDenied

Terraform/AWS CLI failed to create the S3 backend bucket because the active IAM user did not have `s3:CreateBucket` permission.

Resolution:
Remote backend setup was documented as a production enhancement, but skipped in this deployment due to IAM permission restrictions.