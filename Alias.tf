# 1.provider1
---------------

provider "aws" {
region = "ap-south-2"
}

# 2.provider2
---------------

provider "aws" {
region = "ap-south-1"
alias = "mumbai"
}


#3.resource create in two regions
----------------------------------

resource "aws_instance" "i1" {
  tags = {
    Name = "instance1"
  }

  ami               = "ami-id"
  instance_type     = "t3.micro"
  key_name          = "ram"
  availability_zone = "ap-south-2a"
}

resource "aws_instance" "i2" {
  tags = {
    Name = "instance2"
  }

  ami               = "ami-id"
  instance_type     = "t3.micro"
  key_name          = "ram"
  availability_zone = "ap-south-1a"

  provider = aws.mumbai
}



