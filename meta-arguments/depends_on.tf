# depends_on:--Defines an explicit dependency between resources.

# s3 bucket
----------------
resource "aws_s3_bucket" "demo" {
  bucket = "my-demo-bucket-example"
}

#resource ----
----------------
  
resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  depends_on = [aws_s3_bucket.demo]
}


# Explanation: Terraform waits for the bucket's operations to complete before proceeding with the EC2 instance.
# Use depends_on when Terraform cannot automatically identify a dependency.
