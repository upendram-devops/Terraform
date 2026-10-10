module "app" {
  source = "./modules/app"

  providers = {
    aws = aws.us
  }
}

# Explanation: The child module receives the AWS provider configuration referenced by aws.us. The child module must declare the appropriate provider requirements.
