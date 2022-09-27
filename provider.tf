provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.45"
    }
  }
}
terraform {
  backend "s3" {
    bucket = "test-web-sergio"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
    # dynamodb_table = "terraform-lock"
  }
}