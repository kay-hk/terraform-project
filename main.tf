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
  app_port = var.app_port
  cidr_0 = var.cidr_0
  cird_16 = var.cird_16
}

module "dynamodb" {
  source = "./modules/dynamo"

  table_names = var.table_names
  hash_key     = var.hash_key
  hash_key_type = var.hash_key_type
}

module "ec2" {
  source = "./modules/servers"
  security_group_ids = module.sg.security_group_ids
  public_subnet_ids = module.vpc.public_subnets_ids
  private_subnet_ids = module.vpc.private_subnets_ids
  NAT = module.vpc.NAT
}

# module "lb" {
#   source = "./modules/lb"
#   vpc_id = module.vpc.vpc_id
#   private_subnets_ids = module.vpc.private_subnets_ids
#   public_subnets_ids = module.vpc.public_subnets_ids
#   security_group_ids = module.sg.security_group_ids
#   app_port = var.app_port
#   http_protocol = var.http_protocol
#   status_instance_id = module.ec2.status_instance_id
#   auth_instance_id = module.ec2.auth_instance_id
#   lighting_instance_id = module.ec2.lighting_instance_id  
#   heating_instance_id = module.ec2.heating_instance_id
# }