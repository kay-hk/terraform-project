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
  http_port = var.http_port
  https_port = var.https_port
  cidr_0 = var.cidr_0
  cird_16 = var.cird_16
  ipv6_cidr_block = var.ipv6_cidr_block
}

module "dynamodb" {
  source = "./modules/dynamo"
  table_names = var.table_names
  hash_key     = var.hash_key
  hash_key_type = var.hash_key_type
}

module "ec2" {
  source = "./modules/servers"
  key_pair = var.key_pair
  security_group_ids = module.sg.security_group_ids
  public_subnet_ids = module.vpc.public_subnets_ids
  private_subnet_ids = module.vpc.private_subnets_ids
  NAT = module.vpc.NAT
}

module "lb" {
  source = "./modules/lb"
  vpc_id = module.vpc.vpc_id
  private_subnets_ids = module.vpc.private_subnets_ids
  public_subnets_ids = module.vpc.public_subnets_ids
  security_group_ids = module.sg.security_group_ids
  app_port = var.app_port
  http_port = var.http_port
  http_protocol = var.http_protocol
  instance_ids = module.ec2.instance_ids
}

module "launch_templates" {
  source = "./modules/launch_tempates"
  depends_on = [ module.vpc ]
  key_pair = var.key_pair
  azs = var.azs
  instance_type = var.instance_type
  public_subnet_ids = module.vpc.public_subnets_ids
  private_subnet_ids = module.vpc.private_subnets_ids
  security_group_ids = module.sg.security_group_ids
}

module "autoscaling" {
  source = "./modules/autoscaling"
  depends_on = [ module.launch_templates ]
  template_ids = module.launch_templates.template_ids
  target_group_arns = module.lb.target_group_arns
}