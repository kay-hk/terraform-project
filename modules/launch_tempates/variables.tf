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

variable "image_ids" {
  type = list(string)
  default = [
    "ami-06d16139a947bb7d5",
    "ami-080024a0edfd533fc",
    "ami-0a05e4302a6a0ee80",
    "ami-0d1fd218411d963c3",
  ]
}