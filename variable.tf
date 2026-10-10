# provider.tf

provider "aws" {
  region = "ap-south-2"
}


# resource.tf

resource "aws_instance" "myinstance" {
  ami               = var.ami_id
  instance_type     = var.itype
  key_name          = var.key
  availability_zone = var.az

  tags = {
    Name = var.iname
  }

  root_block_device {
    volume_size = var.volume
  }
}


# variable.tf

variable "iname" {
  description = "this is my first instance"
  type        = string
  default     = "webserver"
}

variable "ami_id" {
  description = "we are using amazonlinux"
  type        = string
  default     = "ami-id"   # replace with a real AMI ID
}

variable "itype" {
  description = "instance type"
  type        = string
  default     = "t3.micro"
}

variable "key" {
  description = "key pair name"
  type        = string
  default     = "dswarm"
}

variable "az" {
  description = "availability zone"
  type        = string
  default     = "ap-south-2a"
}

variable "volume" {
  description = "root volume size in GB"
  type        = number
  default     = 20
}


#terraform init
#terraform fmt
#terraform plan
#terraform apply




