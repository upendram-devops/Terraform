What is -target in Terraform?

The -target option in Terraform is used to apply changes to a specific resource instead of applying changes to all resources in the configuration.

example1:

resource "aws_instance" "i1" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}

resource "aws_instance" "i2" {
  ami           = "ami-yyyyyyyy"
  instance_type = "t3.small"

  tags = {
    Name = "instance2"
  }
}


2. Using the -target Option
========================

Apply changes to only instance i1:

terraform apply -target=aws_instance.i1 -----------------Terraform focuses on aws_instance.i1 and any dependencies required for it.

Target only instance i2:

terraform apply -target=aws_instance.i2


3. Target Multiple Resources
=================================
terraform apply -target=aws_instance.i1 -target=aws_instance.i2

