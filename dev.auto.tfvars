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



# variable.tf without default value

variable "iname" {
  description = "this is my first instance"
  type        = string
}

variable "ami_id" {
  description = "we are using amazonlinux"
  type        = string
}

variable "itype" {
  description = "instance type"
  type        = string
}

variable "key" {
  description = "key pair name"
  type        = string
}

variable "az" {
  description = "availability zone"
  type        = string
}

variable "volume" {
  description = "root volume size in GB"
  type        = number
}



# dev.auto.tfvars ---dev instance values

iname  = "dev_server"
itype  = "t3.micro"
key    = "dswarm"
az     = "us-east-2a"
volume = 10
ami_id = "ami_id"      # ⚠️ replace with a real AMI ID


#terraform init
#terraform fmt
# terraform plan -var-file=dev.auto.tfvars
# terraform apply -var-file=dev.auto.tfvars


terraform-project/
├── provider.tf
├── resource.tf
├── variable.tf
├── dev.auto.tfvars
└── .terraform/          (created by terraform init)
