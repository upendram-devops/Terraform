An Internet Gateway (IGW) is an AWS VPC component that allows communication between resources in your VPC and the internet when the required routes 
and security rules are configured.

why igw:-
---------
🌍 Connect public-facing resources to the internet.
📥 Allow internet traffic to reach resources with appropriate public IPs and security rules.
📤 Enable resources with public IPs to access the internet.
🔗 Connect an IGW to a VPC and configure routing through it.

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
