variable "key_pair" {
  type = string
  description = "SSH key for instance pair"
}

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

variable "app_port" {
  type = number
  description = "The port apps listen on"
}

variable "http_port" {
  type = number
  description = "HTTP port 80"
}

variable "https_port" {
  type = number
  description = "HTTPS port 443"
}

variable "cidr_0" {
  type = string
  description = "CIDR block of 0.0.0.0/0"
}

variable "cird_16" {
  type = string
  description = "CIDR block of 10.0.0.0/16"
}

variable "ipv6_cidr_block" {
  type        = string
  description = "IPv6 CIDR block"
}

variable "http_protocol" {  
    type        = string
    description = "HTTP protocol type"
}

variable "table_names" {
  type        = list(string)
  description = "Names of the DynamoDB tables"
}

variable "hash_key" {
  type        = string
  description = "Name of the hash key"
}

variable "hash_key_type" {
  type        = string
  description = "Data type of the hash key"
}