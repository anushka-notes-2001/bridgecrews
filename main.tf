# Terraform Block
terraform {
  #required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = ">= 1.0.0"   
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = ">= 3.0"
      version = ">= 4.65"
    }
  }
    backend "s3" {
    bucket         = "terraform-state-bridgecrew"
    key            = "tftstate2"
    region         = "us-east-1"
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-007855ac798b5175e"  # Change this to your desired AMI ID
  instance_type = "t2.micro" 

  tags = {
    Name = "example-instance"
  }
}
