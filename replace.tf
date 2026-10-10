What is -replace in Terraform?

The -replace option in Terraform is used to destroy an existing resource and create a new one instead of updating the existing resource in place.

1. Example in Real Time

Suppose you have an EC2 instance defined in Terraform:

resource "aws_instance" "i1" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}

Your EC2 instance is running, but you want to replace it with a new instance.


2. Use the -replace Command
===============================
terraform apply -replace="aws_instance.i1"


What happens?
========================

Terraform identifies the specified EC2 instance.
Terraform plans to destroy the existing instance.
Terraform creates a replacement instance.
Terraform updates its state to track the new instance.

Note: Terraform may create the replacement before destroying the old instance if the resource supports create-before-destroy lifecycle behavior. Otherwise, the old instance may be destroyed first.

3. Difference Between -target and -replace
=================================================
Feature	-target	-replace
Purpose	Focus on a specific resource	Force a resource to be replaced
Destroys resource?	Not necessarily	Yes, as part of replacement
Creates a new resource?	Not necessarily	Yes
Example	terraform apply -target=aws_instance.i1	terraform apply -replace="aws_instance.i1"

-replace
==============
Terraform -replace is a command-line option used to force Terraform to destroy and recreate a specific resource, 
even when Terraform would not otherwise replace it.
