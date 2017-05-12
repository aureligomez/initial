## Description

Terraform templates for MCOM Prod VPC

Do **NOT** forget to push your changes into repository!

## Remote state configuration

Configure remote state before using Terraform!

Run this in the directory with Terraform templates
```
terraform remote config -backend=s3 -backend-config="bucket=tf-mcom"\
 -backend-config="key=PROD/network/terraform.tfstate"\
 -backend-config="region=us-east-1"
```
