# create remote state in s3 bucket

- create s3 bucket name called cnl-terraform-state-testing in us-east-1 region

then create main.tf file with the below

```
terraform {
  backend "s3" {
    bucket = "cnl-terraform-state-testing"
    key    = "demo/instance/terraform.tfstate"
    region = "us-west-2"
  }
  }

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "RemoteStateInstance"
  }
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

```

Once this Terraform config is applied it will create a terraform.tfstate file in your S3 bucket path demo/instance/terraform.tfstate. You have successfully deployed Terraform state to a remote backend!

------------------------


