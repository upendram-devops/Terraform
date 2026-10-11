#---------
#provider
#---------
terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.0"
}
}
}

provider "aws" {
region = "us-east-1"

}

#---------
#networking
#---------
resource "aws_vpc" "myvpc" {
cidr_block = "10.0.0.0/16"
enable_dns_support = true
enable_dns_hostnames = true
tags = {
Name = "my-vpc"
}
instance_tenancy = "default"

}

resource "aws_subnet" "public_1" {
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.0.0/24"
availability_zone = "us-east-1a"
map_public_ip_on_launch = true
tags = {
Name = "public-subnet-1"

}
}

resource "aws_subnet" "public_2" {
vpc_id = aws_vpc.myvpc.id
cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1b"
map_public_ip_on_launch = true
tags = {
Name = "public-subnet-2"
}
}

resource "aws_internet_gateway" "my_igw" {
vpc_id = aws_vpc.myvpc.id
tags = {
Name = "my-igw"
}
}

resource "aws_route_table" "public_rt" {
vpc_id = aws_vpc.myvpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.my_igw.id
}
tags = {
Name = "public-route-table"
}
}

resource "aws_route_table_association" "public_rt_assoc_1" {
subnet_id = aws_subnet.public_1.id
route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_assoc_2" {
subnet_id = aws_subnet.public_2.id
route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "mysg" {
name = "my-security-group"
description = "Allow SSH and HTTP"
vpc_id = aws_vpc.myvpc.id

ingress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}


}

#---------
#iam
#---------
resource "aws_iam_role" "eks_role" {
name = "myeksrole"

assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action = "sts:AssumeRole"
Effect = "Allow"
Principal = {
Service = "eks.amazonaws.com"
}
Action = "sts:AssumeRole"
},
]
})

}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
role = aws_iam_role.eks_role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

#---------
#eks_cluster
#---------
resource "aws_eks_cluster" "myeks" {
name = "my-eks-cluster"
role_arn = aws_iam_role.eks_role.arn

vpc_config {
subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]
endpoint_private_access = true
endpoint_public_access = true
}

depends_on = [aws_iam_role_policy_attachment.eks_cluster_policy]
tags = {
Name = "my-eks-cluster"
}
}

resource "aws_iam_role" "eks_nodes" {
name = "eks-nodes-role"

assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action = "sts:AssumeRole"
Effect = "Allow"
Principal = {
Service = "ec2.amazonaws.com"
}
Action = "sts:AssumeRole"
},
]
})
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
role = aws_iam_role.eks_nodes.name
policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
role = aws_iam_role.eks_nodes.name
policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

resource "aws_iam_role_policy_attachment" "eks_registry_policy" {
role = aws_iam_role.eks_nodes.name
policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

resource "aws_eks_node_group" "nodes" {
cluster_name = aws_eks_cluster.myeks.name
node_group_name = "my-eks-node-group-2"
node_role_arn = aws_iam_role.eks_nodes.arn
subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]
instance_types = ["c7i-flex.large"]
capacity_type = "SPOT"
scaling_config {
desired_size = 2
max_size = 4
min_size = 2
}
update_config {
max_unavailable = 1
}

depends_on = [ aws_iam_role_policy_attachment.eks_cni_policy, aws_iam_role_policy_attachment.eks_registry_policy, aws_iam_role_policy_attachment.eks_worker_node_policy]
tags = {
Name = "my-eks-node-group"
}
}

#---------
#output
#---------
output "cluster_name" {
value = aws_eks_cluster.myeks.name

}

output "cluster_endpoint" {
value = aws_eks_cluster.myeks.endpoint

}

output "configure_kubectl" {
value = "aws eks update-kubeconfig --name ${aws_eks_cluster.myeks.name} --region us-east-2"

}
