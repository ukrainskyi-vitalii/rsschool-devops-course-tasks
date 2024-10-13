# DevOps Course. Terraform Infrastructure for AWS with GitHub Actions

# Task 2: Basic Infrastructure Configuration

## Directory Structure:
- modules/iam/: IAM roles and policies management.
- modules/security/: Security Groups configuration.
- ./nacl/: Network ACLs for subnet traffic control.
- ./nat_gateway/: NAT Gateway for private subnets' Internet access.
- ./vpc/: VPC setup including subnets, route tables, and internet gateway.
- bastion.tf: Bastion Host for secure SSH access to private subnets.
- ec2.tf: EC2 instances in public and private subnets.

## Key Resources:
- VPC: Creates the network for the infrastructure.
- Security Groups: Defines inbound and outbound traffic rules for EC2 instances.
- NACL: Controls traffic at the subnet level.
- NAT Gateway: Enables outbound Internet access for instances in private subnets.
- Bastion Host: Secure access to private instances via SSH.
- EC2 Instances: Virtual machines running in public and private subnet

# Usage:
### Initialize Terraform:
```bash
terraform init
```
### Check the plan:
```bash
terraform plan
```
### Apply changes:
```bash
terraform apply
```
### Destroy infrastructure:
```bash
terraform destroy
```

# TASK 1 Task 1: AWS Account Configuration
## Overview

This project sets up AWS infrastructure using Terraform and automates its management via GitHub Actions. The primary resources include:
- An IAM role for GitHub Actions with necessary permissions to work with AWS.
- A remote backend for storing Terraform state in S3 and locking the state via DynamoDB.
- GitHub Actions configuration for automatic deployment.
- An S3 bucket to work with an application

## Prerequisites

Before you start working with this project, ensure that you have:
- **An AWS account** with permissions to create resources (IAM, S3, DynamoDB).
- **A GitHub repository** to store and automate infrastructure management via GitHub Actions.
- **Terraform CLI** installed on your local machine or CI/CD server.

## Project Architecture

This project uses the following resources:
- **S3** for storing Terraform state.
- **DynamoDB** for state locking.
- **IAM Role** for GitHub Actions with required AWS permissions.

## Usage

### 1. Clone the repository

To get started, clone the repository and navigate to the project directory:

```bash
git clone https://github.com/ukrainskyi-vitalii/rsschool-devops-course-tasks.git
cd rsschool-devops-course-tasks.git
```

### 2. Add Secrets and Variables to GitHub

Before you can deploy the infrastructure, you need to set up secrets and repository variables in GitHub.

#### Secrets:
- AWS_ACCOUNT_ID: Your AWS access key ID.

#### Repository Variables:
- AWS_GITHUB_ACTIONS_ROLE_NAME: Your AWS Role name to assume the role.
- AWS_REGION: The name of your AWS region you want to use.
- GH_REPO_NAME: The name of your GitHub repository in the format your_org/your_repo

### 3. Initialize Terraform
Once you've added the necessary secrets and variables, you can initialize Terraform to configure the backend and download the required providers.

```bash
terraform init
```

### 4. Plan Infrastructure Changes
You can preview the changes that will be made to your infrastructure by running:

```bash
terraform plan
```

This command will show you the resources that will be created, updated, or destroyed without actually applying the changes.

### 5. Apply Infrastructure Changes
To apply the changes and deploy the infrastructure, run:

```bash
terraform apply
```

### 6. Check the Outputs
After the infrastructure is deployed successfully, Terraform will display the outputs specified in the outputs.tf file