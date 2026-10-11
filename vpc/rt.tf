An AWS Route Table contains rules that determine where network traffic from a subnet or gateway should go.

why:-
-----
🚦 Direct traffic to the correct destination.
🌍 Connect public subnets to the internet using an Internet Gateway (IGW).
🔒 Allow private subnets to access the internet through a NAT Gateway.
🔗 Control traffic routing within a VPC.

types:
-------
1. Public Route Table

Contains a route to an Internet Gateway.
Example: 0.0.0.0/0 → IGW

2. Private Route Table

Can contain a route to a NAT Gateway for outbound internet access.
Example: 0.0.0.0/0 → NAT Gateway



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
