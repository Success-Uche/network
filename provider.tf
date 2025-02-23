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

  assume_role {
    role_arn = var.aws_role_arn
  }
}

variable "aws_region" {}

variable "aws_role_arn" {}
