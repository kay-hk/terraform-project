variable "public_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the public subnets"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of the CIDR ranges required for the private subnets"
}

variable "azs" {
    type = list(string)
    description = "A list of the Availability Zones you wish to provision infrastructure in"
    
}

variable "cidr_0" {
  type = string
  description = "CIDR block of 0.0.0.0/0"
}

variable "cird_16" {
  type = string
  description = "CIDR block of 10.0.0.0/16"
}