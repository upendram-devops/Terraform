resource "aws_s3_bucket" "mybucket" {
bucket = "terraform-s3-bucket-77"
}

resource "aws_s3_bucket_versioning" "version" {
bucket = aws_s3_bucket.mybucket.id

versioning_configuration {
status = "enabled"
}
}


#store a state file in s3.bucket for create a backend.tf
=========================================================

terraform {
backend "s3" {
bucket = "terraform-s3-bucket-77"
key = "prod/terraform.tfstate"
region = "us-east-1"
}
}


Amazon S3 (Simple Storage Service) is an object storage service provided by AWS. 
It is used to store and retrieve files such as images, videos, documents, backups, and application logs.


Amazon S3 is a scalable object storage service in AWS used to store and retrieve data from anywhere. 
It is commonly used for backups, logs, static website hosting, application files, and Terraform remote state storage.
