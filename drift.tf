What is Drift in Terraform?

Drift in Terraform occurs when the actual infrastructure in AWS differs from the configuration defined in your Terraform files.

Example in Real Time

Suppose you create an EC2 instance using Terraform.

# Step 1: Terraform configuration
==========================================

resource "aws_instance" "i1" {
  ami           = "ami-123456"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}

# Step 2: Create the infrastructure
  =======================================

terraform init
terraform apply

Now, your EC2 instance is running with the t3.micro instance type.

# Step 3: Make a manual change in AWS
=========================================

Suppose someone manually changes the EC2 instance type from t3.micro to t3.small using the AWS Console.

Now, your Terraform configuration and actual AWS infrastructure are different.

This difference is called Terraform Drift.


How to Detect Drift?
=====================

Run the following command:-   terraform plan -refresh-only

# This helps you identify differences between the infrastructure's actual state and Terraform's recorded state.

# To see what Terraform proposes changing to match your configuration, run:  terraform plan


How to Fix Drift?
====================

# If you want AWS infrastructure to match your Terraform configuration, run:-    terraform apply


Remember for Interviews

Terraform Drift = Difference between the desired infrastructure defined in Terraform and the actual infrastructure running in AWS.

Real-time example: Someone manually changes an EC2 instance, security group, or S3 bucket outside Terraform,
                   causing the infrastructure to differ from your configuration.
