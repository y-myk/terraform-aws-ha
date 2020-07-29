locals {
  vpc_mgmt_subnet_ids       = [for num in range(length(var.azs)) : module.vpc.public_subnets[num]]
  vpc_public_subnet_ids     = [for num in range(length(var.azs)) : module.vpc.public_subnets[num + length(var.azs)]]
  vpc_private_subnet_ids    = module.vpc.private_subnets
}
