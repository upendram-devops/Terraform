# create a multiple resources with same configurations using "count"

resource "aws_instance" "web" {
  count         = 5
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "web-server-${count.index + 1}"
  }
}


# Explanation
  #count = 5 → Creates 5 EC2 instances.
  #count.index → Starts indexing from 0.
  #count.index + 1 → Names the instances from 1 to 5.
