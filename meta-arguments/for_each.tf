# Creates multiple resources using a map or set of strings.

# Creates multiple EC2 instances using for_each
============================================

resource "aws_instance" "myinstance" {
  for_each = var.instance

  ami           = each.value.ami_id
  instance_type = each.value.itype
  key_name      = each.value.ikey

  tags = {
    Name = each.value.iname
  }
}


# variable
-------------

variable "instance" {
  description = "It contains all instance configurations."

  type = map(object({
    ami_id = string
    itype  = string
    iname  = string
    ikey   = string
  }))
}


.tfvars
----------

instance = {
  web = {
    ami_id = "ami-xxxxxxxx"
    itype  = "t3.micro"
    iname  = "web-server"
    ikey   = "ram"
  }

  dev = {
    ami_id = "ami-yyyyyyyy"
    itype  = "t3.micro"
    iname  = "dev-server"
    ikey   = "ram"
  }
}


#terraform init      ----- Initializes Terraform and downloads the required provider.
#terraform fmt       ----- Formats your Terraform files.
#terraform validate  ----- Checks the configuration syntax.
#terraform plan      ----- Shows the proposed infrastructure changes.
#terraform apply    ------ Creates the infrastructure after confirmation.
#terraform state list ----- list the resources in tfstate file.
     
#Remember: for_each uses map keys to identify resources, while each.value accesses the configuration associated with each key.
