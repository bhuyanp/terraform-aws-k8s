
#module "ecr" {
#  source = "./ecr"
#  services = ["test"]
#}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name = "fs-app-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.azs
  public_subnets  = var.private-subnet-cidr
  # public_subnet_names = var.public-subnet-name
  private_subnets = var.public-subnet-cidr
  # private_subnet_names = var.private-subnet-name

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = var.tags
}

