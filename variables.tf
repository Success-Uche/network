variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.10.10.0/24", "10.10.20.0/24"]
}

variable "ram_name" {
  description = "Name of the RAM"
  type        = string
  default     = "Network-RAM"
}


variable "ou_sandbox_arn" {
  description = "ARN of the Sandbox OU in AWS Organizations"
  type        = string
}