module "vpc" {
  source          = "./modules/vpc"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
  cidr_0 = var.cidr_0
  cird_16 = var.cird_16
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
  cidr_0 = var.cidr_0
  cird_16 = var.cird_16
}

module "lighting_dynamodb" {
  source       = "./modules/dynamo" 
  table_name   = "Lighting"
  hash_key     = "id"
  hash_key_type = "N" 
}

module "heating_dynamodb" {
  source       = "./modules/dynamo"
  table_name   = "Heating"
  hash_key     = "id"
  hash_key_type = "N" 
}

module "ec2" {
  source = "./modules/servers"
  security_group_ids = module.sg.security_group_ids
  public_subnet_ids = module.vpc.public_subnets_ids
  private_subnet_ids = module.vpc.private_subnets_ids
}