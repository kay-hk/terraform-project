variable "key_pair" {
  type = string
  description = "SSH key for instance pair"
}

variable "instance_type" {
  type        = string
  description = "The instance type of EC2 to create"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "azs" {
  type        = list(string)
  description = "A list of the Availability Zones you wish to provision infrastructure in"
}

variable "public_launch_templates" {
  type = list(string)
  description = "List of templates to create from instances"
}