
Security_group:
===============
-- An AWS Security Group acts as a virtual firewall for AWS resources such as EC2 instances. It controls incoming and outgoing network traffic based on rules.
-- A Security Group has two types of rules:

Inbound Rules: Control traffic coming into your EC2 instance.
Outbound Rules: Control traffic going out of your EC2 instance.


resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = "vpc-xxxxxxxx"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH from trusted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_PUBLIC_IP/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
