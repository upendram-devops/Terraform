🚀 Terraform Commands Cheat Sheet

1. Basic Terraform Commands
terraform -version
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy

2. Resource Management Commands
terraform state list
terraform state show aws_instance.web
terraform refresh
terraform output
terraform show

3. Apply and Destroy Specific Resources
terraform apply -target=aws_instance.web
terraform destroy -target=aws_instance.web
terraform apply -replace=aws_instance.web

Replace aws_instance.web with the actual resource address in your configuration.

4. Variables and Outputs
terraform plan -var="instance_type=t2.micro"
terraform apply -var-file="dev.tfvars"
terraform output
terraform output public_ip

5. State File Commands
terraform state list
terraform state pull
terraform state show aws_vpc.main
terraform state rm aws_instance.web

Warning: terraform state rm removes a resource from Terraform state without deleting the actual AWS resource.

6. Workspace Commands
terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform workspace show
terraform workspace delete dev

7. Import Existing AWS Resources
terraform import aws_instance.web i-0123456789abcdef0
terraform state list
terraform plan

Define the corresponding resource in your .tf file before importing.

8. Debugging Commands
terraform validate
terraform plan
terraform show
terraform console
terraform providers

9. Recommended Workflow

Follow this order when creating AWS resources:

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output

When you want to delete the resources managed by the current configuration:

terraform destroy

Important: Review the execution plan before applying or destroying resources. Commands such as terraform destroy, -target, and -replace can have significant infrastructure impacts.
