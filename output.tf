
# An output block in Terraform is used to display important information about the resources created by Terraform.

# For example, after creating an EC2 instance, you can display its public IP address, private IP address, or instance ID.

output "details" {
values = [aws_instance.web1.id, aws_instance.web1.public_ip, aws_instance.web.public.dns]
}

or

resource "aws_instance" "i1" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "instance1"
  }
}

output "public_ip" {
  value = aws_instance.i1.public_ip
}

output "instance_id" {
  value = aws_instance.i1.id
}

#terraform init
#terraform plan
#terraform apply

output:
-----------
An output block in Terraform is used to display or expose information about created resources, such as an EC2 instance's public IP, instance ID, or DNS name.
Outputs can also be used to share values between Terraform modules.
