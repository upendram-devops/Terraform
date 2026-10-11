VPC:-
-----

VPC (Virtual Private Cloud) is a logically isolated virtual network in AWS where you can launch and manage resources 
such as EC2 instances, databases, and load balancers.

it gave a 35565 ips and divide vpc network into smaller networks(subnets).

subnets are two types:-
------------------------
a). public-subnet:- it allows us to access the internet incomming and outcomming traffic through routtable and help of routable.

>Can provide internet connectivity through an Internet Gateway.
>Commonly used for public-facing load balancers and web servers.
>Requires appropriate routes and security rules.

b) Private Subnet
------------------
>Does not have a direct route to an Internet Gateway for direct internet access.
>Commonly used for databases and application servers.
>Can access the internet for outbound connections through a NAT Gateway, if configured.

c) internet Gateway (IGW)	Enables communication between a VPC and the internet when routing and security rules allow it.
  
d).Route Table	Determines where network traffic is directed.
  
e).Security Group	Controls inbound and outbound traffic for resources.
  
d). Network ACL (NACL)	Filters traffic entering and leaving a subnet.
  
e).NAT Gateway	Allows resources in private subnets to initiate outbound internet connections without accepting unsolicited inbound internet connections.


provider "aws" {
  region = "ap-south-2"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "my-vpc"
  }
}
