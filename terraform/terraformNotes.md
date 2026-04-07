# Terraform Commands

- `terraform init` - Initialize Terraform
- `terraform validate` - Validate configuration
- `terraform plan` - Preview planned changes
- `terraform apply` - Execute changes

---
- `terraform apply -auto-approve` - Apply changes without interactive approval prompt

- `terraform plan -out=<file_name>` - Save execution plan to a file

- `terraform apply <file_name>` - Apply a previously saved plan file

---

## Important Note About Flags

Terraform commands follow this structure:

```
terraform <command> [OPTIONS] [PLAN_FILE]
```

Examples:

```
terraform apply -auto-approve
terraform plan -out=myplan.tfplan
terraform apply myplan.tfplan
```


- `terraform destroy` - Destroy all managed infrastructure

- `terraform fmt` - Format Terraform configuration files

- `terraform show` - Show current state or execution plan details

- `terraform output` - Display output values from configuration

- `terraform refresh` - Update state file with real infrastructure (deprecated in newer versions, use `plan` instead)

- `terraform taint <resource_name>` - Mark resource for recreation on next apply (deprecated, use `-replace` option)

- `terraform apply -replace=<resource_name>` - Recreate a specific resource

- `terraform state list` - List resources in Terraform state

- `terraform state show <resource_name>` - Show details of a resource from state

- `terraform state rm <resource_name>` - Remove resource from state file (does not destroy actual infrastructure)

- `terraform import <resource_name> <resource_id>` - Import existing infrastructure into Terraform state

- `terraform workspace list` - List workspaces

- `terraform workspace new <name>` - Create new workspace

- `terraform workspace select <name>` - Switch workspace

- `terraform workspace delete <name>` - Delete workspace

- `terraform providers` - Show providers used in configuration

- `terraform version` - Show installed Terraform version


# Terraform Blocks

## 1. Provider Block

Defines which cloud/service Terraform will interact with.

```
provider "aws" {
  region = "ap-south-1"
}
```

---

## 2. Resource Block

Used to create infrastructure components.

```
resource "aws_instance" "my_ec2" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"
}
```

Format:
```
resource "<PROVIDER_RESOURCE_TYPE>" "<LOCAL_NAME>" {
  configuration
}
```

---

## 3. Variable Block

Defines input variables to make configuration reusable.

```
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}
```

---

## 4. Output Block

Displays values after Terraform applies changes.

```
output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
```

---

## 5. Terraform Block

Used to configure Terraform settings like required providers and version.

```
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
```

---

## 6. Data Block

Used to fetch existing resources from provider.

```
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
}
```

---

## 7. Locals Block

Defines local values inside configuration.

```
locals {
  instance_name = "Terraform-EC2"
}
```

---

## 8. Module Block

Used to reuse Terraform configurations.

```
module "ec2_instance" {
  source = "./modules/ec2"
}
```

---

## 9. Backend Block

Used to configure remote state storage.

```
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "state/terraform.tfstate"
    region = "ap-south-1"
  }
}
```
