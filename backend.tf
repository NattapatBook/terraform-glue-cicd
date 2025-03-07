terraform {
  backend "s3" {
    bucket = "s3-terraform-state-poc"
    key    = "s3-github-actions/terraform.tfstate"
    region = "ap-southeast-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}