# Creates (RAM) Resource Share
resource "aws_ram_resource_share" "vpc_subnets_share" {
  name                      = var.ram_name
  allow_external_principals = false  # Ensure only AWS Organizations members can access

  tags = {
    Name = var.ram_name
  }
}

# Associate Private Subnets to RAM
resource "aws_ram_resource_association" "private_subnets" {
  count              = length(var.private_subnets)
  resource_arn       = aws_subnet.private_subnets[count.index].arn
  resource_share_arn = aws_ram_resource_share.vpc_subnets_share.arn
}

# Associate Public Subnets to RAM
resource "aws_ram_resource_association" "public_subnets" {
  count              = length(var.public_subnets)
  resource_arn       = aws_subnet.public_subnets[count.index].arn
  resource_share_arn = aws_ram_resource_share.vpc_subnets_share.arn
}

# Share to Sandbox OU
resource "aws_ram_principal_association" "principal_association_sandbox_ou" {
  principal          = var.ou_sandbox_arn  # Use the ARN of the Sandbox OU
  resource_share_arn = aws_ram_resource_share.vpc_subnets_share.arn
}
