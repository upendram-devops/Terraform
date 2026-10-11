NAT Gateway (Network Address Translation) allows resources in a private subnet to access the internet without allowing unsolicited 
internet connections directly to those resources.

why natgateway:-
---------------
🔐 Allows private EC2 instances to access the internet.
📦 Downloads software updates and packages.
🛡️ Keeps private instances from needing public IP addresses.
🌐 Enables outbound internet access while preventing direct inbound connections initiated from the internet.


# Allocate an Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# Create NAT Gateway in a public subnet

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "my-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}
