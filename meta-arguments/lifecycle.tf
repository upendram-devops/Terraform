# 1.create_before_destroy — Creates a replacement before destroying the existing resource.

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  lifecycle {
    prevent_destroy = true
  }
}

# Explanation: Terraform prevents the instance from being destroyed while this lifecycle rule is active.


# 2.prevent_destroy — Rejects plans that would destroy the resource while this rule is active.

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }
}

# Explanation: terraform prevents the downtime, first create a resource and later then destroy the resource.

# 3.ignore_changes — Ignores changes to specified resource attributes when planning updates.

resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  lifecycle {
    ignore_changes = [tags, instance, amid]
  }
}
