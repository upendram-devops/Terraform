resource "aws_instance" "instance" {
  tags = {
    Name        = "terraform-server"
    Environment = "DEV"
    Client      = "flm"
  }
  ami               = "ami-id"
  instance_type     = "t3.micro"
  key_name          = "hi"
  availability_zone = "ap-south-2a"
}


#terraform life-cycle
#terraform init
#terraform plan
#terraform apply --auto-approve
#terraform destory --auto-approve
