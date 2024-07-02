#Setting registry.terraform.io version to connect AWS Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

#Configure our AWS Connection
provider "aws" {
  region = "ap-south-1"
}

#Creation of S3 Bucket
resource "aws_s3_bucket" "terraform_state"{
bucket = "sample terraform-up-and-running-state"

versioning {
  enabled = true
}
