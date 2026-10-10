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
