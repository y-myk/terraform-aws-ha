#
# Create the VPC 
# using directions from https://clouddocs.f5.com/cloud/public/v1/aws/AWS_multiNIC.html
#
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = format("%s-vpc-%s", var.prefix, random_id.id.hex)
  cidr                 = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  private_subnet_suffix = "int"
  public_subnet_suffix  = "ext"

  azs = var.azs

  # vpc mgmt + ext subnets
  public_subnets = concat([for num in range(length(var.azs)) :
    cidrsubnet(var.cidr, 8, num + var.management_subnet_offset)
    ], [for num in range(length(var.azs)) :
    cidrsubnet(var.cidr, 8, num + var.external_subnet_offset)
  ])

  # vpc internasl subnet
  private_subnets = [
    for num in range(length(var.azs)) :
    cidrsubnet(var.cidr, 8, num + var.internal_subnet_offset)
  ]

  tags = {
    Name        = format("%s-subnet-%s", var.prefix, random_id.id.hex)
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_route_table" "alienIP-rt" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = var.alien_ip_range
    network_interface_id = aws_network_interface.bigip-int[0].id
  }

  tags = {
    Name        = format("%s-alienIP-rt-%s", var.prefix, random_id.id.hex)
    f5_cloud_failover_label = "mydeployment"
  }
}

