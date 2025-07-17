terraform {
  cloud {
    organization = "wiz-field-test"

    workspaces {
      name = "wiz-field-test"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  endpoints {
    s3  = "https://s3.us-east-1.amazonaws.com"
    sts = "https://sts.us-east-1.amazonaws.com"
  }
}

resource "aws_s3_bucket" "thisreallystinks" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}