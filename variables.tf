variable "public_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "azs" {
  type        = list(string)
  description = "A list of the Availability Zones you wish to provision infrastructure in"
}

variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}

variable "cidr_0" {
  type = string
  description = "CIDR block of 0.0.0.0/0"
}

variable "cird_16" {
  type = string
  description = "CIDR block of 10.0.0.0/16"
}

variable "table_names" {
  description = "Names of the DynamoDB tables"
  type        = list(string)
}

variable "hash_key" {
  description = "Name of the hash key"
  type        = string
}

variable "hash_key_type" {
  description = "Data type of the hash key"
  type        = string
}