terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "remote" {
    organization = "success-cloud"
    workspaces {
      name = "network"
    }
  }
}

provider "aws" {
  region = var.aws_region

# Use OIDC to authenticate with AWS via Terraform Cloud
  assume_role {
    role_arn = var.aws_role_arn
  }
}
