# Purpose: Specifies which provider configuration Terraform should use for a resource.

provider "aws" {
  region = "ap-south-1"
}

provider "aws" {
  alias  = "us"
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  provider = aws.us
  bucket   = "my-us-demo-bucket-example"
}

# Explanation: The S3 bucket uses the AWS provider configuration aliased as us, which points to us-east-1.


or

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.50"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
