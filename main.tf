module "vpc" {
  source          = "./modules/vpc"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}